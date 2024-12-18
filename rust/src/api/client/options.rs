// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::net::SocketAddr;
use std::ops::Deref;

use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

use crate::api::relay::options::_ConnectionMode;

#[frb(name = "ClientOptions")]
pub struct _ClientOptions {
    inner: Options,
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
    pub fn autoconnect(mut self, val: bool) -> Self {
        self.inner = self.inner.autoconnect(val);
        self
    }

    /// Minimum POW difficulty for received events
    pub fn min_pow(mut self, difficulty: u8) -> Self {
        self.inner = self.inner.min_pow(difficulty);
        self
    }
    
    // pub fn req_filters_chunk_size(mut self, req_filters_chunk_size: u8) -> Self {
    //     self.inner = self.inner.req_filters_chunk_size(req_filters_chunk_size);
    //     self
    // }
    
    /// Auto authenticate to relays (default: true)
    ///
    /// <https://github.com/nostr-protocol/nips/blob/master/42.md>
    pub fn automatic_authentication(mut self, enabled: bool) -> Self {
        self.inner = self.inner.automatic_authentication(enabled);
        self
    }
    
    /// Enable gossip model (default: false)
    pub fn gossip(mut self, enabled: bool) -> Self {
        self.inner = self.inner.gossip(enabled);
        self
    }
    
    /// Connection
    pub fn connection(mut self, connection: &Connection) -> Self {
        self.inner = self.inner.connection(connection.deref().clone());
        self
    }
    
    // /// Set custom relay limits
    // pub fn relay_limits(mut self, limits: &RelayLimits) -> Self {
    //     self.inner = self.inner.relay_limits(limits.deref().clone());
    //     self
    // }
    
    // /// Set max latency (default: None)
    // ///
    // /// Relays with an avg. latency greater that this value will be skipped.
    // pub fn max_avg_latency(mut self, max: Duration) -> Self {
    //     self.inner = self.inner.max_avg_latency(max);
    //     self
    // }
    
    // /// Set filtering mode (default: blacklist)
    // pub fn filtering_mode(mut self, mode: RelayFilteringMode) -> Self {
    //     self.inner = self.inner.filtering_mode(mode.into());
    //     self
    // }
}

/// Connection target
#[frb(name = "ConnectionTarget")]
pub enum _ConnectionTarget {
    /// Use proxy for all relays
    All,
    /// Use proxy only for `.onion` relays
    Onion,
}

impl From<_ConnectionTarget> for ConnectionTarget {
    fn from(value: _ConnectionTarget) -> Self {
        match value {
            _ConnectionTarget::All => Self::All,
            _ConnectionTarget::Onion => Self::Onion,
        }
    }
}

/// Connection
#[frb(name = "Connection")]
pub struct _Connection {
    inner: Connection,
}

impl Deref for _Connection {
    type Target = Connection;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

#[frb(sync)]
impl _Connection {
    pub fn new() -> Self {
        Self {
            inner: Connection::default(),
        }
    }

    /// Set connection mode (default: direct)
    pub fn mode(mut self, mode: _ConnectionMode) -> Result<Self> {
        let mode: ConnectionMode = mode.try_into()?;
        self.inner = self.inner.mode(mode);
        Ok(self)
    }

    /// Set connection target (default: all)
    pub fn target(mut self, target: _ConnectionTarget) -> Self {
        self.inner = self.inner.target(target.into());
        self
    }

    /// Set proxy (ex. `127.0.0.1:9050`)
    #[cfg(not(target_arch = "wasm32"))]
    pub fn addr(mut self, addr: &str) -> Result<Self> {
        let addr: SocketAddr = addr.parse()?;
        self.inner = self.inner.proxy(addr);
        Ok(self)
    }
    
    /// Use embedded tor client
    ///
    /// This not work on `android` and/or `ios` targets.
    /// Use [`Connection::embedded_tor_with_path`] instead.
    #[cfg(not(target_arch = "wasm32"))]
    pub fn embedded_tor(mut self) -> Self {
        self.inner = self.inner.embedded_tor();
        self
    }
    
    /// Use embedded tor client
    ///
    /// Specify a path where to store data
    #[cfg(not(target_arch = "wasm32"))]
    pub fn embedded_tor_with_path(mut self, data_path: String) -> Self {
        self.inner = self.inner.embedded_tor_with_path(data_path);
        self
    }
}
