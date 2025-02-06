// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../frb_generated.dart';
import '../event.dart';
import '../key/public_key.dart';
import 'id.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'tag.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `deref`, `from`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_UnsignedEvent>>
abstract class UnsignedEvent implements RustOpaqueInterface {
  /// Add signature to unsigned event
  ///
  /// Internally verify the event.
  Event addSignature({required String sig});

  /// Serialize as JSON
  String asJson();

  /// Serialize as pretty JSON
  String asPrettyJson();

  /// Get author
  PublicKey author();

  /// Get content
  String content();

  /// Get UNIX timestamp
  BigInt createdAt();

  /// Deserialize from JSON
  static UnsignedEvent fromJson({required String json}) => NostrSdk.instance.api
      .crateApiProtocolEventUnsignedUnsignedEventFromJson(json: json);

  /// Get event ID
  EventId? id();

  /// Get kind
  int kind();

  /// Get tags
  List<Tag> tags();
}
