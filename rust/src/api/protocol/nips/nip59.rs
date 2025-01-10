// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

use crate::api::protocol::event::_Event;
use crate::api::protocol::event::unsigned::_UnsignedEvent;
use crate::api::protocol::key::_PublicKey;
use crate::api::protocol::signer::_NostrSigner;

/// Unwrapped Gift Wrap
///
/// <https://github.com/nostr-protocol/nips/blob/master/59.md>
#[frb(name = "UnwrappedGift")]
pub struct _UnwrappedGift {
    pub(crate) inner: UnwrappedGift,
}

impl From<UnwrappedGift> for _UnwrappedGift {
    fn from(inner: UnwrappedGift) -> Self {
        Self { inner }
    }
}

impl _UnwrappedGift {
    /// Unwrap Gift Wrap event
    ///
    /// Internally verify the `seal` event
    pub async fn from_gift_wrap(signer: &_NostrSigner, gift_wrap: &_Event) -> Result<Self> {
        Ok(Self {
            inner: UnwrappedGift::from_gift_wrap(signer.deref(), gift_wrap.deref()).await?,
        })
    }

    /// Get sender public key
    #[frb(sync)]
    pub fn sender(&self) -> _PublicKey {
        self.inner.sender.into()
    }

    /// Get rumor
    #[frb(sync)]
    pub fn rumor(&self) -> _UnsignedEvent {
        self.inner.rumor.clone().into()
    }
}
