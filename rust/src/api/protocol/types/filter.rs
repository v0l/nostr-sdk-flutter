// Copyright (c) 2022-2023 Yuki Kishimoto
// Copyright (c) 2023-2025 Rust Nostr Developers
// Distributed under the MIT software license

use std::ops::Deref;

use anyhow::Result;
use flutter_rust_bridge::frb;
use nostr_sdk::prelude::*;

use crate::api::protocol::event::_Event;
use crate::api::protocol::event::id::_EventId;
use crate::api::protocol::key::_PublicKey;

#[frb]
pub enum Alphabet {
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
}

impl From<Alphabet> for filter::Alphabet {
    fn from(value: Alphabet) -> Self {
        match value {
            Alphabet::A => Self::A,
            Alphabet::B => Self::B,
            Alphabet::C => Self::C,
            Alphabet::D => Self::D,
            Alphabet::E => Self::E,
            Alphabet::F => Self::F,
            Alphabet::G => Self::G,
            Alphabet::H => Self::H,
            Alphabet::I => Self::I,
            Alphabet::J => Self::J,
            Alphabet::K => Self::K,
            Alphabet::L => Self::L,
            Alphabet::M => Self::M,
            Alphabet::N => Self::N,
            Alphabet::O => Self::O,
            Alphabet::P => Self::P,
            Alphabet::Q => Self::Q,
            Alphabet::R => Self::R,
            Alphabet::S => Self::S,
            Alphabet::T => Self::T,
            Alphabet::U => Self::U,
            Alphabet::V => Self::V,
            Alphabet::W => Self::W,
            Alphabet::X => Self::X,
            Alphabet::Y => Self::Y,
            Alphabet::Z => Self::Z,
        }
    }
}

#[frb(name = "SingleLetterTag")]
pub struct _SingleLetterTag {
    pub(crate) inner: SingleLetterTag,
}

impl From<SingleLetterTag> for _SingleLetterTag {
    fn from(inner: SingleLetterTag) -> Self {
        Self { inner }
    }
}

#[frb(sync)]
impl _SingleLetterTag {
    /// New lowercase single-letter tag
    pub fn lowercase(character: Alphabet) -> Self {
        Self {
            inner: SingleLetterTag::lowercase(character.into()),
        }
    }

    /// New uppercase single-letter tag
    pub fn uppercase(character: Alphabet) -> Self {
        Self {
            inner: SingleLetterTag::uppercase(character.into()),
        }
    }

    /// Check if it's lowercase
    pub fn is_lowercase(&self) -> bool {
        self.inner.is_lowercase()
    }

    /// Check if it's uppercase
    pub fn is_uppercase(&self) -> bool {
        self.inner.is_uppercase()
    }
}

#[derive(Clone)]
#[frb(name = "SingleLetterTag")]
pub struct _Filter {
    pub(crate) inner: Filter,
}

impl From<Filter> for _Filter {
    fn from(f: Filter) -> Self {
        Self { inner: f }
    }
}

#[frb(sync)]
impl _Filter {
    pub fn new() -> Self {
        Self {
            inner: Filter::new(),
        }
    }

    pub fn id(&self, id: _EventId) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.id(id.inner);
        builder
    }

    pub fn ids(&self, ids: &[_EventId]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.ids(ids.iter().map(|id| id.inner));
        builder
    }

    pub fn remove_ids(&self, ids: &[_EventId]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_ids(ids.iter().map(|id| id.inner));
        builder
    }

    /// Add event author Public Key
    pub fn author(&self, author: &_PublicKey) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.author(author.inner);
        builder
    }

    pub fn authors(&self, authors: &[_PublicKey]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.authors(authors.iter().map(|pk| pk.inner));
        builder
    }

    pub fn remove_authors(&self, authors: &[_PublicKey]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder
            .inner
            .remove_authors(authors.iter().map(|pk| pk.inner));
        builder
    }

    pub fn kind(&self, kind: u16) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.kind(Kind::from_u16(kind));
        builder
    }

    pub fn kinds(&self, kinds: Vec<u16>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.kinds(kinds.into_iter().map(Kind::from_u16));
        builder
    }

    pub fn remove_kinds(&self, kinds: Vec<u16>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder
            .inner
            .remove_kinds(kinds.into_iter().map(Kind::from_u16));
        builder
    }

    /// Add event ID (`e` tag)
    pub fn event(&self, id: &_EventId) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.event(id.inner);
        builder
    }

    /// Add event IDs (`e` tag)
    pub fn events(&self, ids: &[_EventId]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.events(ids.iter().map(|id| id.inner));
        builder
    }

    pub fn remove_events(&self, ids: &[_EventId]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_events(ids.iter().map(|id| id.inner));
        builder
    }

    /// Add Public Key (`p` tag)
    pub fn pubkey(&self, pubkey: &_PublicKey) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.pubkey(pubkey.inner);
        builder
    }

    /// Add Public Keys (`p` tag)
    pub fn pubkeys(&self, pubkeys: &[_PublicKey]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.pubkeys(pubkeys.iter().map(|pk| pk.inner));
        builder
    }

    pub fn remove_pubkeys(&self, pubkeys: &[_PublicKey]) -> Self {
        let mut builder = self.clone();
        builder.inner = builder
            .inner
            .remove_pubkeys(pubkeys.iter().map(|pk| pk.inner));
        builder
    }

    pub fn hashtag(&self, hashtag: &str) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.hashtag(hashtag);
        builder
    }

    pub fn hashtags(&self, hashtags: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.hashtags(hashtags);
        builder
    }

    pub fn remove_hashtags(&self, hashtags: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_hashtags(hashtags);
        builder
    }

    pub fn reference(&self, reference: &str) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.reference(reference);
        builder
    }

    pub fn references(&self, references: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.references(references);
        builder
    }

    pub fn remove_references(&self, references: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_references(references);
        builder
    }

    pub fn identifier(&self, identifier: &str) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.identifier(identifier);
        builder
    }

    pub fn identifiers(&self, identifiers: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.identifiers(identifiers);
        builder
    }

    pub fn remove_identifiers(&self, identifiers: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_identifiers(identifiers);
        builder
    }

    // /// Add coordinate
    // ///
    // /// Query for `a` tag.
    // ///
    // /// <https://github.com/nostr-protocol/nips/blob/master/01.md>
    // pub fn coordinate(&self, coordinate: &Coordinate) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder.inner.coordinate(coordinate.deref());
    //     builder
    // }
    //
    // /// Add coordinates
    // ///
    // /// Query for `a` tags.
    // ///
    // /// <https://github.com/nostr-protocol/nips/blob/master/01.md>
    // pub fn coordinates(&self, coordinates: Vec<Arc<Coordinate>>) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder
    //         .inner
    //         .coordinates(coordinates.iter().map(|c| c.as_ref().deref()));
    //     builder
    // }
    //
    // /// Remove coordinates
    // ///
    // /// Remove `a` tags.
    // ///
    // /// <https://github.com/nostr-protocol/nips/blob/master/01.md>
    // pub fn remove_coordinates(&self, coordinates: Vec<Arc<Coordinate>>) -> Self {
    //     let mut builder = self.clone();
    //     builder.inner = builder
    //         .inner
    //         .remove_coordinates(coordinates.iter().map(|c| c.as_ref().deref()));
    //     builder
    // }

    pub fn search(&self, text: &str) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.search(text);
        builder
    }

    pub fn remove_search(&self) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_search();
        builder
    }

    pub fn since(&self, timestamp: u64) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.since(Timestamp::from_secs(timestamp));
        builder
    }

    pub fn remove_since(&self) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_since();
        builder
    }

    pub fn until(&self, timestamp: u64) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.until(Timestamp::from_secs(timestamp));
        builder
    }

    pub fn remove_until(&self) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_until();
        builder
    }

    pub fn limit(&self, limit: u64) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.limit(limit as usize);
        builder
    }

    pub fn remove_limit(&self) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_limit();
        builder
    }

    pub fn custom_tag(&self, tag: _SingleLetterTag, content: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.custom_tag(tag.inner, content);
        builder
    }

    pub fn remove_custom_tag(&self, tag: _SingleLetterTag, content: Vec<String>) -> Self {
        let mut builder = self.clone();
        builder.inner = builder.inner.remove_custom_tag(tag.inner, content);
        builder
    }

    pub fn is_empty(&self) -> bool {
        self.inner.is_empty()
    }

    /// Determine if `Filter` match given `Event`.
    pub fn match_event(&self, event: &_Event) -> bool {
        self.inner.match_event(event.deref())
    }

    pub fn from_json(json: &str) -> Result<Self> {
        Ok(Self {
            inner: Filter::from_json(json)?,
        })
    }

    pub fn as_json(&self) -> Result<String> {
        Ok(self.inner.try_as_json()?)
    }
}
