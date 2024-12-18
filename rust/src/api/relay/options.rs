// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::path::PathBuf;

use anyhow::Error;
use nostr_sdk::prelude;

/// Connection mode
pub enum ConnectionMode {
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

impl From<prelude::ConnectionMode> for ConnectionMode {
    fn from(mode: prelude::ConnectionMode) -> Self {
        match mode {
            prelude::ConnectionMode::Direct => Self::Direct,
            #[cfg(not(target_arch = "wasm32"))]
            prelude::ConnectionMode::Proxy(addr) => Self::Proxy {
                addr: addr.to_string(),
            },
            #[cfg(not(target_arch = "wasm32"))]
            prelude::ConnectionMode::Tor { custom_path } => Self::Tor {
                custom_path: custom_path.map(|p| p.to_string_lossy().into_owned()),
            },
        }
    }
}

impl TryFrom<ConnectionMode> for prelude::ConnectionMode {
    type Error = Error;

    fn try_from(mode: ConnectionMode) -> Result<Self, Self::Error> {
        match mode {
            ConnectionMode::Direct => Ok(Self::Direct),
            #[cfg(not(target_arch = "wasm32"))]
            ConnectionMode::Proxy { addr } => Ok(Self::Proxy(addr.parse()?)),
            #[cfg(not(target_arch = "wasm32"))]
            ConnectionMode::Tor { custom_path } => Ok(Self::Tor {
                custom_path: custom_path.map(PathBuf::from),
            }),
        }
    }
}
