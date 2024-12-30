// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

pub mod builder;
pub mod options;
pub mod output;

use self::builder::_ClientBuilder;
use self::output::SendEventOutput;
use super::protocol::event::_Event;
use super::protocol::event::builder::_EventBuilder;

#[frb(name = "Client")]
pub struct _Client {
    inner: Client,
}

impl From<Client> for _Client {
    fn from(inner: Client) -> Self {
        Self { inner }
    }
}

impl _Client {
    #[frb(sync)]
    pub fn new() -> Self {
        Self {
            inner: Client::default(),
        }
    }

    /// New client builder
    #[frb(sync)]
    pub fn builder() -> _ClientBuilder {
        _ClientBuilder::new()
    }

    /// Auto authenticate to relays (default: true)
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/42.md>
    #[frb(sync)]
    pub fn automatic_authentication(&self, enable: bool) {
        self.inner.automatic_authentication(enable);
    }

    /// Add relay
    ///
    /// Relays added with this method will have both `READ` and `WRITE` flags enabled.
    ///
    /// If the relay already exists, the flags will be updated and `false` returned.
    ///
    /// If are set pool subscriptions, the new added relay will inherit them.
    ///
    /// Connection is **NOT** automatically started with relay, remember to call `connect` method!
    pub async fn add_relay(&self, url: &str) -> Result<bool> {
        Ok(self.inner.add_relay(url).await?)
    }

    /// Connect to all added relays
    pub async fn connect(&self) {
        self.inner.connect().await
    }

    /// Send event
    ///
    /// Send `Event` to all relays with `WRITE` flag.
    /// If `gossip` option is enabled, the event will be sent also to NIP65 relays (automatically discovered).
    pub async fn send_event(&self, event: _Event) -> Result<SendEventOutput> {
        let output = self.inner.send_event(event.inner).await?;
        Ok(output.into())
    }

    /// Send event
    ///
    /// Take an [`EventBuilder`], sign it by using the [`NostrSigner`] and broadcast to relays (check [`Client::send_event`] from more details).
    ///
    /// Return an error if the [`NostrSigner`] is not set.
    pub async fn send_event_builder(&self, builder: _EventBuilder) -> Result<SendEventOutput> {
        let output = self.inner.send_event_builder(builder.inner).await?;
        Ok(output.into())
    }
}
