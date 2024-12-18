// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use nostr_sdk::prelude::*;
use flutter_rust_bridge::frb;

use super::_Client;
use super::options::_ClientOptions;

#[derive(Clone)]
#[frb(name = "ClientBuilder")]
pub struct _ClientBuilder {
    inner: ClientBuilder,
}

impl From<ClientBuilder> for _ClientBuilder {
    fn from(inner: ClientBuilder) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _ClientBuilder {
    /// New client builder
    pub fn new() -> Self {
        Self {
            inner: ClientBuilder::new(),
        }
    }

    // pub fn signer(&self, signer: &NostrSigner) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.signer(signer.deref().clone());
    //     builder
    // }
    // 
    // pub fn zapper(&self, zapper: &NostrZapper) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.zapper(zapper.deref().clone());
    //     builder
    // }
    // 
    // pub fn database(&self, database: &NostrDatabase) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.database(database.deref().clone());
    //     builder
    // }

    /// Set opts
    pub fn opts(&self, opts: _ClientOptions) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.opts(opts.inner);
        builder
    }

    /// Build client
    pub fn build(self) -> _Client {
        self.inner.build().into()
    }
}
