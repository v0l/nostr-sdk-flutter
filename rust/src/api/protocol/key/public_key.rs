// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

/// Public key
#[frb(name = "PublicKey")]
pub struct _PublicKey {
    inner: PublicKey,
}

impl From<PublicKey> for _PublicKey {
    fn from(inner: PublicKey) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _PublicKey {
    /// Parse from `hex`, `bech32` or [NIP21](https://github.com/nostr-protocol/nips/blob/master/21.md) URI
    pub fn parse(public_key: &str) -> Result<Self> {
        Ok(Self {
            inner: PublicKey::parse(public_key)?,
        })
    }

    /// Parse from bytes
    pub fn from_slice(public_key: &[u8]) -> Result<Self> {
        Ok(Self {
            inner: PublicKey::from_slice(public_key)?,
        })
    }

    /// Serialize to hex
    pub fn to_hex(&self) -> String {
        self.inner.to_hex()
    }

    /// Serialize to bech32
    pub fn to_bech32(&self) -> Result<String> {
        Ok(self.inner.to_bech32()?)
    }

    /// Serialize as nostr URI
    pub fn to_nostr_uri(&self) -> Result<String> {
        Ok(self.inner.to_nostr_uri()?)
    }

    /// Serialize to bytes
    pub fn to_bytes(&self) -> [u8; PublicKey::LEN] {
        self.inner.to_bytes()
    }
}
