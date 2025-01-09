// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use nostr_sdk::{pool, JsonUtil};

use crate::api::protocol::event::_Event;
use crate::frb_generated::RustAutoOpaque;

pub enum RelayPoolNotification {
    /// Received an [`Event`]. Does not include events sent by this client.
    Event {
        /// Relay url
        relay_url: String,
        /// Subscription ID
        subscription_id: String,
        /// Event
        event: RustAutoOpaque<_Event>,
    },
    /// Received a [`RelayMessage`]. Includes messages wrapping events that were sent by this client.
    Message {
        /// Relay url
        relay_url: String,
        /// Relay Message
        message: String,
    },
    /// Shutdown
    ///
    /// This notification variant is sent after [`Client::shutdown`] method is called and all connections have been closed.
    Shutdown,
}

impl From<pool::RelayPoolNotification> for RelayPoolNotification {
    fn from(notification: pool::RelayPoolNotification) -> Self {
        match notification {
            pool::RelayPoolNotification::Event {
                relay_url,
                subscription_id,
                event,
            } => Self::Event {
                relay_url: relay_url.to_string(),
                subscription_id: subscription_id.to_string(),
                event: RustAutoOpaque::new((*event).into()),
            },
            pool::RelayPoolNotification::Message { relay_url, message } => Self::Message {
                relay_url: relay_url.to_string(),
                message: message.as_json(),
            },
            pool::RelayPoolNotification::Shutdown => Self::Shutdown,
            _ => unreachable!(),
        }
    }
}
