// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

pub mod builder;
pub mod id;
pub mod tag;
pub mod unsigned;

use self::id::_EventId;
use self::tag::_Tag;
use super::key::_PublicKey;

/// Nostr event
#[frb(name = "Event")]
pub struct _Event {
    pub(crate) inner: Event,
}

impl From<Event> for _Event {
    fn from(inner: Event) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _Event {
    /// Get event ID
    pub fn id(&self) -> _EventId {
        self.inner.id.into()
    }

    /// Get event author (`pubkey` field)
    pub fn author(&self) -> _PublicKey {
        self.inner.pubkey.into()
    }

    /// Get UNIX timestamp
    pub fn created_at(&self) -> u64 {
        self.inner.created_at.as_u64()
    }

    /// Get event kind
    pub fn kind(&self) -> u16 {
        self.inner.kind.as_u16()
    }

    /// Get event tags
    pub fn tags(&self) -> Vec<_Tag> {
        self.inner
            .tags
            .iter()
            .cloned()
            .map(|tag| tag.into())
            .collect()
    }

    /// Get event content
    pub fn content(&self) -> String {
        self.inner.content.to_string()
    }

    /// Get event signature
    pub fn signature(&self) -> String {
        self.inner.sig.to_string()
    }

    /// Verify both the event ID and the signature
    pub fn verify(&self) -> Result<()> {
        Ok(self.inner.verify()?)
    }

    /// Verify if the event ID it's composed correctly
    pub fn verify_id(&self) -> bool {
        self.inner.verify_id()
    }

    /// Verify only the event signature
    pub fn verify_signature(&self) -> bool {
        self.inner.verify_signature()
    }

    /// Returns `true` if the event has an expiration tag that is expired.
    /// If an event has no expiration tag, then it will return `false`.
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/40.md>
    pub fn is_expired(&self) -> bool {
        self.inner.is_expired()
    }

    /// Check if it's a protected event
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/70.md>
    pub fn is_protected(&self) -> bool {
        self.inner.is_protected()
    }

    /// Deserialize from JSON
    pub fn from_json(json: &str) -> Result<Self> {
        Ok(Self {
            inner: Event::from_json(json)?,
        })
    }

    /// Serialize as JSON
    pub fn as_json(&self) -> Result<String> {
        Ok(self.inner.try_as_json()?)
    }

    /// Serialize as pretty JSON
    pub fn as_pretty_json(&self) -> Result<String> {
        Ok(self.inner.try_as_pretty_json()?)
    }
}
