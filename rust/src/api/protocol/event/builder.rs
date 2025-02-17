// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

use super::_Event;
use super::tag::_Tag;
use super::unsigned::_UnsignedEvent;
use crate::api::protocol::key::{_Keys, _PublicKey};
use crate::api::protocol::signer::_NostrSigner;

/// Nostr event builder
#[derive(Clone)]
#[frb(name = "EventBuilder")]
pub struct _EventBuilder {
    pub(crate) inner: EventBuilder,
}

// Sync methods
#[frb(sync)]
impl _EventBuilder {
    /// New event builder
    pub fn new(kind: u16, content: &str) -> Self {
        let kind = Kind::from_u16(kind);
        Self {
            inner: EventBuilder::new(kind, content),
        }
    }

    /// Add tag
    pub fn tag(&self, tag: &_Tag) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.tag(tag.inner.clone());
        builder
    }

    /// Add tags
    ///
    /// This method extends the current tags (if any).
    pub fn tags(&self, tags: Vec<_Tag>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.tags(tags.into_iter().map(|t| t.inner));
        builder
    }

    /// Set a custom `created_at` UNIX timestamp
    pub fn custom_created_at(&self, created_at: u64) -> Self {
        let mut builder = self.clone();
        builder.inner = builder
            .inner
            .custom_created_at(Timestamp::from_secs(created_at));
        builder
    }

    /// Set POW difficulty
    ///
    /// Only values `> 0` are accepted!
    pub fn pow(&self, difficulty: u8) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.pow(difficulty);
        builder
    }

    /// Build, sign and return event using keys signer
    pub fn sign_with_keys(&self, keys: &_Keys) -> Result<_Event> {
        let event: Event = self.inner.clone().sign_with_keys(keys.deref())?;
        Ok(event.into())
    }

    /// Build unsigned event
    pub fn build(&self, public_key: &_PublicKey) -> _UnsignedEvent {
        self.inner.clone().build(public_key.inner).into()
    }

    /// Text note
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/01.md>
    pub fn text_note(content: &str) -> Self {
        Self {
            inner: EventBuilder::text_note(content),
        }
    }

    /// Gift Wrap from seal
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/59.md>
    pub fn gift_wrap_from_seal(
        receiver: &_PublicKey,
        seal: &_Event,
        extra_tags: Vec<_Tag>,
    ) -> Result<_Event> {
        Ok(EventBuilder::gift_wrap_from_seal(
            receiver.deref(),
            seal.deref(),
            extra_tags.into_iter().map(|t| t.inner),
        )?
        .into())
    }
}

// Async methods
impl _EventBuilder {
    /// Build, sign and return event
    pub async fn sign(&self, signer: &_NostrSigner) -> Result<_Event> {
        let event = self.inner.clone().sign(signer.deref()).await?;
        Ok(event.into())
    }

    /// Seal
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/59.md>
    #[inline]
    pub async fn seal(
        signer: &_NostrSigner,
        receiver: &_PublicKey,
        rumor: &_UnsignedEvent,
    ) -> Result<Self> {
        Ok(Self {
            inner: EventBuilder::seal(signer.deref(), receiver.deref(), rumor.inner.clone())
                .await?,
        })
    }

    /// Gift Wrap
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/59.md>
    pub async fn gift_wrap(
        signer: &_NostrSigner,
        receiver: &_PublicKey,
        rumor: &_UnsignedEvent,
        extra_tags: Vec<_Tag>,
    ) -> Result<_Event> {
        Ok(EventBuilder::gift_wrap(
            signer.deref(),
            receiver.deref(),
            rumor.inner.clone(),
            extra_tags.into_iter().map(|t| t.inner),
        )
        .await?
        .into())
    }

    /// Private Direct message
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/17.md>
    pub async fn private_msg(
        signer: &_NostrSigner,
        receiver: &_PublicKey,
        message: &str,
        rumor_extra_tags: Vec<_Tag>,
    ) -> Result<_Event> {
        Ok(EventBuilder::private_msg(
            signer.deref(),
            receiver.inner,
            message,
            rumor_extra_tags.into_iter().map(|t| t.inner),
        )
        .await?
        .into())
    }
}
