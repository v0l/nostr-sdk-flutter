// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::path::PathBuf;

use anyhow::Error;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

/// Connection mode
#[frb(name = "ConnectionMode")]
pub enum _ConnectionMode {
    /// Direct connection
    Direct,
    /// Connect through proxy
    #[cfg(not(target_arch = "wasm32"))]
    Proxy {
        /// Socket addr (i.e. 127.0.0.1:9050)
        addr: String,
    },
    /// Connect through tor network
    #[cfg(not(target_arch = "wasm32"))]
    Tor {
        /// Path where to store data
        ///
        /// This is required for `android` and `ios` targets!
        custom_path: Option<String>,
    },
}

impl From<ConnectionMode> for _ConnectionMode {
    fn from(mode: ConnectionMode) -> Self {
        match mode {
            ConnectionMode::Direct => Self::Direct,
            #[cfg(not(target_arch = "wasm32"))]
            ConnectionMode::Proxy(addr) => Self::Proxy {
                addr: addr.to_string(),
            },
            #[cfg(not(target_arch = "wasm32"))]
            ConnectionMode::Tor { custom_path } => Self::Tor {
                custom_path: custom_path.map(|p| p.to_string_lossy().into_owned()),
            },
        }
    }
}

impl TryFrom<_ConnectionMode> for ConnectionMode {
    type Error = Error;

    fn try_from(mode: _ConnectionMode) -> Result<Self, Self::Error> {
        match mode {
            _ConnectionMode::Direct => Ok(Self::Direct),
            #[cfg(not(target_arch = "wasm32"))]
            _ConnectionMode::Proxy { addr } => Ok(Self::Proxy(addr.parse()?)),
            #[cfg(not(target_arch = "wasm32"))]
            _ConnectionMode::Tor { custom_path } => Ok(Self::Tor {
                custom_path: custom_path.map(PathBuf::from),
            }),
        }
    }
}
