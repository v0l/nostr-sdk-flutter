// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'protocol/event.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<_Client>>
abstract class Client implements RustOpaqueInterface {
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

  /// Connect to all added relays
  Future<void> connect();

  factory Client() => NostrSdk.instance.api.crateApiClientClientNew();

  /// Send event
  ///
  /// Send `Event` to all relays with `WRITE` flag.
  /// If `gossip` option is enabled, the event will be sent also to NIP65 relays (automatically discovered).
  Future<String> sendEvent({required Event event});
}
