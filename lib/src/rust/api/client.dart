// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'client/builder.dart';
import 'client/output.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'protocol/event.dart';
import 'protocol/event/builder.dart';
import 'protocol/signer.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `from`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_Client>>
abstract class Client implements RustOpaqueInterface {
  /// Add discovery relay
  ///
  /// If relay already exists, this method automatically add the [`RelayServiceFlags::DISCOVERY`] flag to it and return `false`.
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/65.md>
  Future<bool> addDiscoveryRelay({required String url});

  /// Add read relay
  ///
  /// If relay already exists, this method add the [`RelayServiceFlags::READ`] flag to it and return `false`.
  ///
  /// If are set pool subscriptions, the new added relay will inherit them. Use `subscribe_to` method instead of `subscribe`,
  /// to avoid to set pool subscriptions.
  Future<bool> addReadRelay({required String url});

  /// Add relay
  ///
  /// Relays added with this method will have both `READ` and `WRITE` flags enabled.
  ///
  /// If the relay already exists, the flags will be updated and `false` returned.
  ///
  /// If are set pool subscriptions, the new added relay will inherit them.
  ///
  /// Connection is **NOT** automatically started with relay, remember to call `connect` method!
  Future<bool> addRelay({required String url});

  /// Add write relay
  ///
  /// If relay already exists, this method add the [`RelayServiceFlags::WRITE`] flag to it and return `false`.
  Future<bool> addWriteRelay({required String url});

  /// Auto authenticate to relays (default: true)
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/42.md>
  void automaticAuthentication({required bool enable});

  /// New client builder
  static ClientBuilder builder() =>
      NostrSdk.instance.api.crateApiClientClientBuilder();

  /// Connect to all added relays
  Future<void> connect();

  /// Connect to a previously added relay
  Future<void> connectRelay({required String url});

  /// Disconnect from all relays
  Future<void> disconnect();

  /// Disconnect relay
  Future<void> disconnectRelay({required String url});

  /// Disconnect and force remove all relays
  Future<void> forceRemoveAllRelays();

  /// Force remove and disconnect relay
  ///
  /// Note: this method will remove the relay, also if it's in use for the gossip model or other service!
  Future<void> forceRemoveRelay({required String url});

  /// Check if signer is configured
  Future<bool> hasSigner();

  factory Client() => NostrSdk.instance.api.crateApiClientClientNew();

  /// Disconnect and remove all relays
  ///
  /// Some relays used by some services could not be disconnected with this method
  /// (like the ones used for gossip).
  /// Use [`Client::force_remove_all_relays`] to remove every relay.
  Future<void> removeAllRelays();

  /// Remove and disconnect relay
  ///
  /// If the relay has [`RelayServiceFlags::GOSSIP`], it will not be removed from the pool and its
  /// flags will be updated (remove [`RelayServiceFlags::READ`],
  /// [`RelayServiceFlags::WRITE`] and [`RelayServiceFlags::DISCOVERY`] flags).
  ///
  /// To force remove the relay, use [`Client::force_remove_relay`].
  Future<void> removeRelay({required String url});

  /// Reset client
  ///
  /// This method reset the client to simplify the switch to another account.
  Future<void> reset();

  /// Send event
  ///
  /// Send `Event` to all relays with `WRITE` flag.
  /// If `gossip` option is enabled, the event will be sent also to NIP65 relays (automatically discovered).
  Future<SendEventOutput> sendEvent({required Event event});

  /// Send event
  ///
  /// Take an [`EventBuilder`], sign it by using the [`NostrSigner`] and broadcast to relays (check [`Client::send_event`] from more details).
  ///
  /// Return an error if the [`NostrSigner`] is not set.
  Future<SendEventOutput> sendEventBuilder({required EventBuilder builder});

  /// Set nostr signer
  Future<void> setSigner({required NostrSigner signer});

  /// Completely shutdown client
  Future<void> shutdown();

  /// Get current nostr signer
  ///
  /// Rise error if it not set.
  Future<NostrSigner> signer();

  /// Unset nostr signer
  Future<void> unsetSigner();
}
