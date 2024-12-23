// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;
use std::str::FromStr;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

use super::_Event;
use super::tag::_Tag;
use crate::api::protocol::key::_PublicKey;

/// Unsigned event
#[frb(name = "UnsignedEvent")]
pub struct _UnsignedEvent {
    pub(crate) inner: UnsignedEvent,
}

impl Deref for _UnsignedEvent {
    type Target = UnsignedEvent;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl From<UnsignedEvent> for _UnsignedEvent {
    fn from(inner: UnsignedEvent) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _UnsignedEvent {
    /// Get event ID
    pub fn id(&self) -> Option<String> {
        self.inner.id.map(|id| id.to_string())
    }

    /// Get author
    pub fn author(&self) -> _PublicKey {
        self.inner.pubkey.into()
    }

    /// Get UNIX timestamp
    pub fn created_at(&self) -> u64 {
        self.inner.created_at.as_u64()
    }

    /// Get kind
    pub fn kind(&self) -> u16 {
        self.inner.kind.as_u16()
    }

    /// Get tags
    pub fn tags(&self) -> Vec<_Tag> {
        self.inner
            .tags
            .iter()
            .cloned()
            .map(|tag| tag.into())
            .collect()
    }

    /// Get content
    pub fn content(&self) -> String {
        // TODO: return &str?
        self.inner.content.clone()
    }

    /// Add signature to unsigned event
    ///
    /// Internally verify the event.
    pub fn add_signature(&self, sig: &str) -> Result<_Event> {
        let sig = Signature::from_str(sig)?;
        Ok(self.inner.clone().add_signature(sig)?.into())
    }

    /// Deserialize from JSON
    pub fn from_json(json: String) -> Result<Self> {
        Ok(Self {
            inner: UnsignedEvent::from_json(json)?,
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
