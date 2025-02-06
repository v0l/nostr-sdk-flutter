// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'event.dart';
import 'event/unsigned.dart';
import 'key.dart';
import 'key/public_key.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'signer.freezed.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `deref`, `from`, `from`, `from`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_NostrSigner>>
abstract class NostrSigner implements RustOpaqueInterface {
  /// Get backend
  SignerBackend backend();

  /// Get public key
  Future<PublicKey> getPublicKey();

  /// Keys signer
  static NostrSigner keys({required Keys keys}) =>
      NostrSdk.instance.api.crateApiProtocolSignerNostrSignerKeys(keys: keys);

  /// Decrypt
  Future<String> nip04Decrypt(
      {required PublicKey publicKey, required String encryptedContent});

  /// Encrypt
  Future<String> nip04Encrypt(
      {required PublicKey publicKey, required String content});

  /// Decrypt
  Future<String> nip44Decrypt(
      {required PublicKey publicKey, required String content});

  /// Encrypt
  Future<String> nip44Encrypt(
      {required PublicKey publicKey, required String content});

  /// Sign event
  Future<Event> signEvent({required UnsignedEvent unsignedEvent});
}

@freezed
sealed class SignerBackend with _$SignerBackend {
  const SignerBackend._();

  /// Secret key
  const factory SignerBackend.keys() = SignerBackend_Keys;

  /// Browser extension (NIP07)
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/07.md>
  const factory SignerBackend.browserExtension() =
      SignerBackend_BrowserExtension;

  /// Nostr Connect (NIP46)
  ///
  /// <https://github.com/nostr-protocol/nips/blob/master/46.md>
  const factory SignerBackend.nostrConnect() = SignerBackend_NostrConnect;

  /// Custom
  const factory SignerBackend.custom(
    String field0,
  ) = SignerBackend_Custom;
}
