// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::net::SocketAddr;
use std::ops::Deref;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::{self, *};

use crate::api::relay::options::ConnectionMode;

#[derive(Clone)]
#[frb(name = "ClientOptions")]
pub struct _ClientOptions {
    pub(super) inner: Options,
}

impl Deref for _ClientOptions {
    type Target = Options;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl From<Options> for _ClientOptions {
    fn from(inner: Options) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _ClientOptions {
    pub fn new() -> Self {
        Self {
            inner: Options::new(),
        }
    }

    /// Automatically start connection with relays (default: false)
    ///
    /// When set to `true`, there isn't the need of calling the connect methods.
    pub fn autoconnect(&self, val: bool) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.autoconnect(val);
        builder
    }

    /// Minimum POW difficulty for received events
    pub fn min_pow(&self, difficulty: u8) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.min_pow(difficulty);
        builder
    }

    // pub fn req_filters_chunk_size(&self, req_filters_chunk_size: u8) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.req_filters_chunk_size(req_filters_chunk_size);
    //     builder
    // }

    /// Auto authenticate to relays (default: true)
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/42.md>
    pub fn automatic_authentication(&self, enabled: bool) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.automatic_authentication(enabled);
        builder
    }

    /// Enable gossip model (default: false)
    pub fn gossip(&self, enabled: bool) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.gossip(enabled);
        builder
    }

    /// Connection
    pub fn connection(&self, connection: _Connection) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.connection(connection.inner);
        builder
    }

    // /// Set custom relay limits
    // pub fn relay_limits(&self, limits: &RelayLimits) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.relay_limits(limits.deref().clone());
    //     builder
    // }
    // 
    // /// Set max latency (default: None)
    // ///
    // /// Relays with an avg. latency greater that this value will be skipped.
    // pub fn max_avg_latency(&self, max: Duration) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.max_avg_latency(max);
    //     builder
    // }
    // 
    // /// Set filtering mode (default: blacklist)
    // pub fn filtering_mode(&self, mode: RelayFilteringMode) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.filtering_mode(mode.into());
    //     builder
    // }
}

/// Connection target
#[cfg(not(target_arch = "wasm32"))]
pub enum ConnectionTarget {
    /// Use proxy for all relays
    All,
    /// Use proxy only for `.onion` relays
    Onion,
}

#[cfg(not(target_arch = "wasm32"))]
impl From<ConnectionTarget> for prelude::ConnectionTarget {
    fn from(value: ConnectionTarget) -> Self {
        match value {
            ConnectionTarget::All => Self::All,
            ConnectionTarget::Onion => Self::Onion,
        }
    }
}

/// Connection
#[derive(Clone)]
#[cfg(not(target_arch = "wasm32"))]
#[frb(name = "Connection")]
pub struct _Connection {
    inner: Connection,
}

#[cfg(not(target_arch = "wasm32"))]
#[frb(sync)]
impl _Connection {
    pub fn new() -> Self {
        Self {
            inner: Connection::default(),
        }
    }

    /// Set connection mode (default: direct)
    pub fn mode(&self, mode: ConnectionMode) -> Result<Self> {
        let mode: prelude::ConnectionMode = mode.try_into()?;
        let mut builder = self.clone();
        builder.inner = builder.inner.mode(mode);
        Ok(builder)
    }

    /// Set connection target (default: all)
    pub fn target(&self, target: ConnectionTarget) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.target(target.into());
        builder
    }

    /// Set proxy (ex. `127.0.0.1:9050`)
    pub fn addr(&self, addr: &str) -> Result<Self> {
        let mut builder = self.clone();
        let addr: SocketAddr = addr.parse()?;
        builder.inner = builder.inner.proxy(addr);
        Ok(builder)
    }

    /// Use embedded tor client
    ///
    /// This not work on `android` and/or `ios` targets.
    /// Use [`Connection::embedded_tor_with_path`] instead.
    pub fn embedded_tor(&self) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.embedded_tor();
        builder
    }

    /// Use embedded tor client
    ///
    /// Specify a path where to store data
    pub fn embedded_tor_with_path(&self, data_path: String) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.embedded_tor_with_path(data_path);
        builder
    }
}
