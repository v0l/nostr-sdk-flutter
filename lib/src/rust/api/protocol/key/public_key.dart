// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `deref`, `from`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_PublicKey>>
abstract class PublicKey implements RustOpaqueInterface {
  /// Parse from bytes
  static PublicKey fromSlice({required List<int> publicKey}) =>
      NostrSdk.instance.api
          .crateApiProtocolKeyPublicKeyPublicKeyFromSlice(publicKey: publicKey);

  /// Parse from `hex`, `bech32` or [NIP21](https://github.com/nostr-protocol/nips/blob/master/21.md) URI
  static PublicKey parse({required String publicKey}) => NostrSdk.instance.api
      .crateApiProtocolKeyPublicKeyPublicKeyParse(publicKey: publicKey);

  /// Serialize to bech32
  String toBech32();

  /// Serialize to bytes
  Uint8List toBytes();

  /// Serialize to hex
  String toHex();

  /// Serialize as nostr URI
  String toNostrUri();
}
