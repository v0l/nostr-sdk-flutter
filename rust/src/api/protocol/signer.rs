// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::borrow::Cow;
use std::ops::Deref;
use std::sync::Arc;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::{self, *};

use super::event::_Event;
use super::event::unsigned::_UnsignedEvent;
use super::key::{_Keys, _PublicKey};

/// Signer backend
pub enum SignerBackend {
    /// Secret key
    Keys,
    /// Browser extension (NIP07)
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/07.md>
    BrowserExtension,
    /// Nostr Connect (NIP46)
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/46.md>
    NostrConnect,
    /// Custom
    Custom(String),
}

impl<'a> From<prelude::SignerBackend<'a>> for SignerBackend {
    fn from(backend: prelude::SignerBackend<'a>) -> Self {
        match backend {
            prelude::SignerBackend::Keys => Self::Keys,
            prelude::SignerBackend::BrowserExtension => Self::BrowserExtension,
            prelude::SignerBackend::NostrConnect => Self::NostrConnect,
            prelude::SignerBackend::Custom(backend) => Self::Custom(backend.into_owned()),
        }
    }
}

impl<'a> From<SignerBackend> for prelude::SignerBackend<'a> {
    fn from(backend: SignerBackend) -> Self {
        match backend {
            SignerBackend::Keys => Self::Keys,
            SignerBackend::BrowserExtension => Self::BrowserExtension,
            SignerBackend::NostrConnect => Self::NostrConnect,
            SignerBackend::Custom(backend) => Self::Custom(Cow::Owned(backend)),
        }
    }
}

/// Nostr signer
#[frb(name = "NostrSigner")]
pub struct _NostrSigner {
    pub(crate) inner: Arc<dyn NostrSigner>,
}

impl Deref for _NostrSigner {
    type Target = Arc<dyn NostrSigner>;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl From<Arc<dyn NostrSigner>> for _NostrSigner {
    fn from(inner: Arc<dyn NostrSigner>) -> Self {
        Self { inner }
    }
}

impl _NostrSigner {
    /// Keys signer
    #[frb(sync)]
    pub fn keys(keys: &_Keys) -> Self {
        Self {
            inner: keys.inner.clone().into_nostr_signer(),
        }
    }

    // #[frb(sync)]
    // pub fn nostr_connect(connect: &NostrConnect) -> Self {
    //     let signer = connect.deref().clone();
    //     Self {
    //         inner: signer.into_nostr_signer(),
    //     }
    // }

    /// Get backend
    #[frb(sync)]
    pub fn backend(&self) -> SignerBackend {
        self.inner.backend().into()
    }

    /// Get public key
    pub async fn get_public_key(&self) -> Result<_PublicKey> {
        Ok(self.inner.get_public_key().await?.into())
    }

    /// Sign event
    pub async fn sign_event(&self, unsigned_event: &_UnsignedEvent) -> Result<_Event> {
        Ok(self
            .inner
            .sign_event(unsigned_event.inner.clone())
            .await?
            .into())
    }

    /// Encrypt
    pub async fn nip04_encrypt(&self, public_key: &_PublicKey, content: &str) -> Result<String> {
        Ok(self
            .inner
            .nip04_encrypt(public_key.deref(), content)
            .await?)
    }

    /// Decrypt
    pub async fn nip04_decrypt(
        &self,
        public_key: &_PublicKey,
        encrypted_content: &str,
    ) -> Result<String> {
        Ok(self
            .inner
            .nip04_decrypt(public_key.deref(), encrypted_content)
            .await?)
    }

    /// Encrypt
    pub async fn nip44_encrypt(&self, public_key: &_PublicKey, content: &str) -> Result<String> {
        Ok(self
            .inner
            .nip44_encrypt(public_key.deref(), content)
            .await?)
    }

    /// Decrypt
    pub async fn nip44_decrypt(&self, public_key: &_PublicKey, content: &str) -> Result<String> {
        Ok(self
            .inner
            .nip44_decrypt(public_key.deref(), content)
            .await?)
    }
}
