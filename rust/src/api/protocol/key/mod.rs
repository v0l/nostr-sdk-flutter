// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

pub mod public_key;
pub mod secret_key;

pub use self::public_key::_PublicKey;
pub use self::secret_key::_SecretKey;

/// Keys
#[frb(name = "Keys")]
pub struct _Keys {
    pub(crate) inner: Keys,
}

impl Deref for _Keys {
    type Target = Keys;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

#[frb(sync)]
impl _Keys {
    /// Construct keys from secret key
    pub fn new(secret_key: &_SecretKey) -> Self {
        Self {
            inner: Keys::new(secret_key.inner.clone()),
        }
    }

    /// Generate random keys
    ///
    /// This constructor uses a random number generator that retrieves randomness from the operating system.
    pub fn generate() -> Self {
        Self {
            inner: Keys::generate(),
        }
    }

    /// Parse secret key from `hex` or `bech32`
    pub fn parse(secret_key: &str) -> Result<Self> {
        Ok(Self {
            inner: Keys::parse(secret_key)?,
        })
    }

    /// Get public key
    pub fn public_key(&self) -> _PublicKey {
        self.inner.public_key().into()
    }

    /// Get secret key
    pub fn secret_key(&self) -> _SecretKey {
        self.inner.secret_key().clone().into()
    }
}
