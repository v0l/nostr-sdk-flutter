// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2024 Rust Nostr Developers
// Distributed under the MIT software license

use std::collections::{HashMap, HashSet};

use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

/// Output
#[frb]
pub struct SendEventOutput {
    /// Event ID
    pub id: String,
    /// Set of relays that success
    pub success: HashSet<String>,
    /// Map of relays that failed, with related errors.
    pub failed: HashMap<String, String>,
}

impl From<Output<EventId>> for SendEventOutput {
    fn from(output: Output<EventId>) -> Self {
        Self {
            id: output.id().to_string(),
            success: output.success.into_iter().map(|u| u.to_string()).collect(),
            failed: output
                .failed
                .into_iter()
                .map(|(u, e)| (u.to_string(), e))
                .collect(),
        }
    }
}
