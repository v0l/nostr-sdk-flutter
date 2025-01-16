// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;
#[cfg(not(target_arch = "wasm32"))]
use std::path::PathBuf;

use anyhow::{Error, Result};
use chrono::Duration;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::{self, *};

/// Connection mode
pub enum ConnectionMode {
    /// Direct connection
    Direct,
    /// Connect through proxy
    ///
    /// This doesn't work on web!
    Proxy {
        /// Socket addr (i.e. 127.0.0.1:9050)
        addr: String,
    },
    /// Connect through tor network
    ///
    /// This doesn't work on web!
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
            #[cfg(target_arch = "wasm32")]
            ConnectionMode::Proxy { .. } => unreachable!("Proxy is not supported on wasm!"),
            #[cfg(not(target_arch = "wasm32"))]
            ConnectionMode::Tor { custom_path } => Ok(Self::Tor {
                custom_path: custom_path.map(PathBuf::from),
            }),
            #[cfg(target_arch = "wasm32")]
            ConnectionMode::Tor { .. } => unreachable!("Tor is not supported on wasm!"),
        }
    }
}

/// Request (REQ) exit policy
pub enum ReqExitPolicy {
    /// Exit on EOSE
    ExitOnEOSE,
    /// After EOSE is received, keep listening for N more events that match the filter.
    WaitForEventsAfterEOSE(u16),
    /// After EOSE is received, keep listening for matching events for `Duration` more time.
    WaitDurationAfterEOSE(Duration),
}

impl TryFrom<ReqExitPolicy> for prelude::ReqExitPolicy {
    type Error = Error;

    fn try_from(value: ReqExitPolicy) -> Result<Self, Self::Error> {
        match value {
            ReqExitPolicy::ExitOnEOSE => Ok(Self::ExitOnEOSE),
            ReqExitPolicy::WaitForEventsAfterEOSE(num) => Ok(Self::WaitForEventsAfterEOSE(num)),
            ReqExitPolicy::WaitDurationAfterEOSE(duration) => {
                Ok(Self::WaitDurationAfterEOSE(duration.to_std()?))
            }
        }
    }
}

/// Auto-closing subscribe options
#[derive(Clone, Copy)]
#[frb(name = "SubscribeAutoCloseOptions")]
pub struct _SubscribeAutoCloseOptions {
    pub(crate) inner: SubscribeAutoCloseOptions,
}

impl Deref for _SubscribeAutoCloseOptions {
    type Target = SubscribeAutoCloseOptions;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

#[frb(sync)]
impl _SubscribeAutoCloseOptions {
    pub fn new() -> Self {
        Self {
            inner: SubscribeAutoCloseOptions::default(),
        }
    }

    /// Close subscription when the policy is satisfied
    pub fn exit_policy(&self, policy: ReqExitPolicy) -> Result<Self> {
        let mut builder = self.clone();
        builder.inner = builder.inner.exit_policy(policy.try_into()?);
        Ok(builder)
    }

    /// Automatically close subscription after duration.
    pub fn timeout(&self, timeout: Option<Duration>) -> Result<Self> {
        let timeout = match timeout {
            Some(timeout) => Some(timeout.to_std()?),
            None => None,
        };

        let mut builder = self.clone();
        builder.inner = builder.inner.timeout(timeout);
        Ok(builder)
    }

    /// Automatically close subscription if no notifications/events are received within the duration.
    pub fn idle_timeout(&self, timeout: Option<Duration>) -> Result<Self> {
        let timeout = match timeout {
            Some(timeout) => Some(timeout.to_std()?),
            None => None,
        };

        let mut builder = self.clone();
        builder.inner = builder.inner.idle_timeout(timeout);
        Ok(builder)
    }
}
