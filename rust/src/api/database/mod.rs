// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2025 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;
use std::sync::Arc;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::{self, IntoNostrDatabase, NostrDatabase};
#[cfg(not(target_arch = "wasm32"))]
use nostr_sdk::NostrLMDB;

pub mod events;

use self::events::_Events;
use super::protocol::event::_Event;
use super::protocol::event::id::_EventId;
use super::protocol::filter::_Filter;

/// Reason why event wasn't stored into the database
pub enum RejectedReason {
    /// Ephemeral events aren't expected to be stored
    Ephemeral,
    /// The event already exists
    Duplicate,
    /// The event was deleted
    Deleted,
    /// The event is expired
    Expired,
    /// The event was replaced
    Replaced,
    /// Attempt to delete a non-owned event
    InvalidDelete,
    /// Other reason
    Other,
}

impl From<prelude::RejectedReason> for RejectedReason {
    fn from(status: prelude::RejectedReason) -> Self {
        match status {
            prelude::RejectedReason::Ephemeral => Self::Ephemeral,
            prelude::RejectedReason::Duplicate => Self::Duplicate,
            prelude::RejectedReason::Deleted => Self::Deleted,
            prelude::RejectedReason::Expired => Self::Expired,
            prelude::RejectedReason::Replaced => Self::Replaced,
            prelude::RejectedReason::InvalidDelete => Self::InvalidDelete,
            prelude::RejectedReason::Other => Self::Other,
        }
    }
}

/// Save event status
pub enum SaveEventStatus {
    /// The event has been successfully saved
    Success,
    /// The event has been rejected
    Rejected(RejectedReason),
}

impl From<prelude::SaveEventStatus> for SaveEventStatus {
    fn from(status: prelude::SaveEventStatus) -> Self {
        match status {
            prelude::SaveEventStatus::Success => Self::Success,
            prelude::SaveEventStatus::Rejected(reason) => Self::Rejected(reason.into()),
        }
    }
}

#[frb(name = "NostrDatabase")]
pub struct _NostrDatabase {
    inner: Arc<dyn NostrDatabase>,
}

impl Deref for _NostrDatabase {
    type Target = Arc<dyn NostrDatabase>;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl From<Arc<dyn NostrDatabase>> for _NostrDatabase {
    fn from(inner: Arc<dyn NostrDatabase>) -> Self {
        Self { inner }
    }
}

impl _NostrDatabase {
    /// LMDB backend
    #[cfg(not(target_arch = "wasm32"))]
    #[frb(sync)]
    pub fn lmdb(path: &str) -> Result<Self> {
        let db = Arc::new(NostrLMDB::open(path)?);
        Ok(Self {
            inner: db.into_nostr_database(),
        })
    }

    /// Save [`Event`] into store
    pub async fn save_event(&self, event: &_Event) -> Result<SaveEventStatus> {
        Ok(self.inner.save_event(event.deref()).await?.into())
    }

    /// Get [`Event`] by [`EventId`]
    pub async fn event_by_id(&self, event_id: &_EventId) -> Result<Option<_Event>> {
        Ok(self
            .inner
            .event_by_id(event_id.deref())
            .await?
            .map(|e| e.into()))
    }

    pub async fn count(&self, filter: &_Filter) -> Result<u64> {
        Ok(self.inner.count(filter.inner.clone()).await? as u64)
    }

    pub async fn query(&self, filter: &_Filter) -> Result<_Events> {
        Ok(self.inner.query(filter.inner.clone()).await?.into())
    }

    /// Delete all events that match the `Filter`
    pub async fn delete(&self, filter: &_Filter) -> Result<()> {
        Ok(self.inner.delete(filter.inner.clone()).await?)
    }

    /// Wipe all data
    pub async fn wipe(&self) -> Result<()> {
        Ok(self.inner.wipe().await?)
    }
}
