// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'event/id.dart';
import 'event/tag.dart';
import 'key/public_key.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `deref`, `from`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_Event>>
abstract class Event implements RustOpaqueInterface {
  /// Serialize as JSON
  String asJson();

  /// Serialize as pretty JSON
  String asPrettyJson();

  /// Get event author (`pubkey` field)
  PublicKey author();

  /// Get event content
  String content();

  /// Get UNIX timestamp
  BigInt createdAt();

  /// Deserialize from JSON
  static Event fromJson({required String json}) =>
      NostrSdk.instance.api.crateApiProtocolEventEventFromJson(json: json);

  /// Get event ID
  EventId id();

  /// Returns `true` if the event has an expiration tag that is expired.
  /// If an event has no expiration tag, then it will return `false`.
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/40.md>
  bool isExpired();

  /// Check if it's a protected event
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/70.md>
  bool isProtected();

  /// Get event kind
  int kind();

  /// Get event signature
  String signature();

  /// Get event tags
  List<Tag> tags();

  /// Verify both the event ID and the signature
  void verify();

  /// Verify if the event ID it's composed correctly
  bool verifyId();

  /// Verify only the event signature
  bool verifySignature();
}
