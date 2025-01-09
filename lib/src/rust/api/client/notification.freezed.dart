// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RelayPoolNotification {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String relayUrl, String subscriptionId, Event event)
        event,
    required TResult Function(String relayUrl, String message) message,
    required TResult Function() shutdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult? Function(String relayUrl, String message)? message,
    TResult? Function()? shutdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult Function(String relayUrl, String message)? message,
    TResult Function()? shutdown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RelayPoolNotification_Event value) event,
    required TResult Function(RelayPoolNotification_Message value) message,
    required TResult Function(RelayPoolNotification_Shutdown value) shutdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RelayPoolNotification_Event value)? event,
    TResult? Function(RelayPoolNotification_Message value)? message,
    TResult? Function(RelayPoolNotification_Shutdown value)? shutdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RelayPoolNotification_Event value)? event,
    TResult Function(RelayPoolNotification_Message value)? message,
    TResult Function(RelayPoolNotification_Shutdown value)? shutdown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelayPoolNotificationCopyWith<$Res> {
  factory $RelayPoolNotificationCopyWith(RelayPoolNotification value,
          $Res Function(RelayPoolNotification) then) =
      _$RelayPoolNotificationCopyWithImpl<$Res, RelayPoolNotification>;
}

/// @nodoc
class _$RelayPoolNotificationCopyWithImpl<$Res,
        $Val extends RelayPoolNotification>
    implements $RelayPoolNotificationCopyWith<$Res> {
  _$RelayPoolNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RelayPoolNotification_EventImplCopyWith<$Res> {
  factory _$$RelayPoolNotification_EventImplCopyWith(
          _$RelayPoolNotification_EventImpl value,
          $Res Function(_$RelayPoolNotification_EventImpl) then) =
      __$$RelayPoolNotification_EventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String relayUrl, String subscriptionId, Event event});
}

/// @nodoc
class __$$RelayPoolNotification_EventImplCopyWithImpl<$Res>
    extends _$RelayPoolNotificationCopyWithImpl<$Res,
        _$RelayPoolNotification_EventImpl>
    implements _$$RelayPoolNotification_EventImplCopyWith<$Res> {
  __$$RelayPoolNotification_EventImplCopyWithImpl(
      _$RelayPoolNotification_EventImpl _value,
      $Res Function(_$RelayPoolNotification_EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relayUrl = null,
    Object? subscriptionId = null,
    Object? event = null,
  }) {
    return _then(_$RelayPoolNotification_EventImpl(
      relayUrl: null == relayUrl
          ? _value.relayUrl
          : relayUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ));
  }
}

/// @nodoc

class _$RelayPoolNotification_EventImpl extends RelayPoolNotification_Event {
  const _$RelayPoolNotification_EventImpl(
      {required this.relayUrl,
      required this.subscriptionId,
      required this.event})
      : super._();

  /// Relay url
  @override
  final String relayUrl;

  /// Subscription ID
  @override
  final String subscriptionId;

  /// Event
  @override
  final Event event;

  @override
  String toString() {
    return 'RelayPoolNotification.event(relayUrl: $relayUrl, subscriptionId: $subscriptionId, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelayPoolNotification_EventImpl &&
            (identical(other.relayUrl, relayUrl) ||
                other.relayUrl == relayUrl) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, relayUrl, subscriptionId, event);

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelayPoolNotification_EventImplCopyWith<_$RelayPoolNotification_EventImpl>
      get copyWith => __$$RelayPoolNotification_EventImplCopyWithImpl<
          _$RelayPoolNotification_EventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String relayUrl, String subscriptionId, Event event)
        event,
    required TResult Function(String relayUrl, String message) message,
    required TResult Function() shutdown,
  }) {
    return event(relayUrl, subscriptionId, this.event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult? Function(String relayUrl, String message)? message,
    TResult? Function()? shutdown,
  }) {
    return event?.call(relayUrl, subscriptionId, this.event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult Function(String relayUrl, String message)? message,
    TResult Function()? shutdown,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(relayUrl, subscriptionId, this.event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RelayPoolNotification_Event value) event,
    required TResult Function(RelayPoolNotification_Message value) message,
    required TResult Function(RelayPoolNotification_Shutdown value) shutdown,
  }) {
    return event(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RelayPoolNotification_Event value)? event,
    TResult? Function(RelayPoolNotification_Message value)? message,
    TResult? Function(RelayPoolNotification_Shutdown value)? shutdown,
  }) {
    return event?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RelayPoolNotification_Event value)? event,
    TResult Function(RelayPoolNotification_Message value)? message,
    TResult Function(RelayPoolNotification_Shutdown value)? shutdown,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(this);
    }
    return orElse();
  }
}

abstract class RelayPoolNotification_Event extends RelayPoolNotification {
  const factory RelayPoolNotification_Event(
      {required final String relayUrl,
      required final String subscriptionId,
      required final Event event}) = _$RelayPoolNotification_EventImpl;
  const RelayPoolNotification_Event._() : super._();

  /// Relay url
  String get relayUrl;

  /// Subscription ID
  String get subscriptionId;

  /// Event
  Event get event;

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelayPoolNotification_EventImplCopyWith<_$RelayPoolNotification_EventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RelayPoolNotification_MessageImplCopyWith<$Res> {
  factory _$$RelayPoolNotification_MessageImplCopyWith(
          _$RelayPoolNotification_MessageImpl value,
          $Res Function(_$RelayPoolNotification_MessageImpl) then) =
      __$$RelayPoolNotification_MessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String relayUrl, String message});
}

/// @nodoc
class __$$RelayPoolNotification_MessageImplCopyWithImpl<$Res>
    extends _$RelayPoolNotificationCopyWithImpl<$Res,
        _$RelayPoolNotification_MessageImpl>
    implements _$$RelayPoolNotification_MessageImplCopyWith<$Res> {
  __$$RelayPoolNotification_MessageImplCopyWithImpl(
      _$RelayPoolNotification_MessageImpl _value,
      $Res Function(_$RelayPoolNotification_MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relayUrl = null,
    Object? message = null,
  }) {
    return _then(_$RelayPoolNotification_MessageImpl(
      relayUrl: null == relayUrl
          ? _value.relayUrl
          : relayUrl // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RelayPoolNotification_MessageImpl
    extends RelayPoolNotification_Message {
  const _$RelayPoolNotification_MessageImpl(
      {required this.relayUrl, required this.message})
      : super._();

  /// Relay url
  @override
  final String relayUrl;

  /// Relay Message
  @override
  final String message;

  @override
  String toString() {
    return 'RelayPoolNotification.message(relayUrl: $relayUrl, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelayPoolNotification_MessageImpl &&
            (identical(other.relayUrl, relayUrl) ||
                other.relayUrl == relayUrl) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, relayUrl, message);

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelayPoolNotification_MessageImplCopyWith<
          _$RelayPoolNotification_MessageImpl>
      get copyWith => __$$RelayPoolNotification_MessageImplCopyWithImpl<
          _$RelayPoolNotification_MessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String relayUrl, String subscriptionId, Event event)
        event,
    required TResult Function(String relayUrl, String message) message,
    required TResult Function() shutdown,
  }) {
    return message(relayUrl, this.message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult? Function(String relayUrl, String message)? message,
    TResult? Function()? shutdown,
  }) {
    return message?.call(relayUrl, this.message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult Function(String relayUrl, String message)? message,
    TResult Function()? shutdown,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(relayUrl, this.message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RelayPoolNotification_Event value) event,
    required TResult Function(RelayPoolNotification_Message value) message,
    required TResult Function(RelayPoolNotification_Shutdown value) shutdown,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RelayPoolNotification_Event value)? event,
    TResult? Function(RelayPoolNotification_Message value)? message,
    TResult? Function(RelayPoolNotification_Shutdown value)? shutdown,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RelayPoolNotification_Event value)? event,
    TResult Function(RelayPoolNotification_Message value)? message,
    TResult Function(RelayPoolNotification_Shutdown value)? shutdown,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class RelayPoolNotification_Message extends RelayPoolNotification {
  const factory RelayPoolNotification_Message(
      {required final String relayUrl,
      required final String message}) = _$RelayPoolNotification_MessageImpl;
  const RelayPoolNotification_Message._() : super._();

  /// Relay url
  String get relayUrl;

  /// Relay Message
  String get message;

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelayPoolNotification_MessageImplCopyWith<
          _$RelayPoolNotification_MessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RelayPoolNotification_ShutdownImplCopyWith<$Res> {
  factory _$$RelayPoolNotification_ShutdownImplCopyWith(
          _$RelayPoolNotification_ShutdownImpl value,
          $Res Function(_$RelayPoolNotification_ShutdownImpl) then) =
      __$$RelayPoolNotification_ShutdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RelayPoolNotification_ShutdownImplCopyWithImpl<$Res>
    extends _$RelayPoolNotificationCopyWithImpl<$Res,
        _$RelayPoolNotification_ShutdownImpl>
    implements _$$RelayPoolNotification_ShutdownImplCopyWith<$Res> {
  __$$RelayPoolNotification_ShutdownImplCopyWithImpl(
      _$RelayPoolNotification_ShutdownImpl _value,
      $Res Function(_$RelayPoolNotification_ShutdownImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelayPoolNotification
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RelayPoolNotification_ShutdownImpl
    extends RelayPoolNotification_Shutdown {
  const _$RelayPoolNotification_ShutdownImpl() : super._();

  @override
  String toString() {
    return 'RelayPoolNotification.shutdown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelayPoolNotification_ShutdownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String relayUrl, String subscriptionId, Event event)
        event,
    required TResult Function(String relayUrl, String message) message,
    required TResult Function() shutdown,
  }) {
    return shutdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult? Function(String relayUrl, String message)? message,
    TResult? Function()? shutdown,
  }) {
    return shutdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String relayUrl, String subscriptionId, Event event)?
        event,
    TResult Function(String relayUrl, String message)? message,
    TResult Function()? shutdown,
    required TResult orElse(),
  }) {
    if (shutdown != null) {
      return shutdown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RelayPoolNotification_Event value) event,
    required TResult Function(RelayPoolNotification_Message value) message,
    required TResult Function(RelayPoolNotification_Shutdown value) shutdown,
  }) {
    return shutdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RelayPoolNotification_Event value)? event,
    TResult? Function(RelayPoolNotification_Message value)? message,
    TResult? Function(RelayPoolNotification_Shutdown value)? shutdown,
  }) {
    return shutdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RelayPoolNotification_Event value)? event,
    TResult Function(RelayPoolNotification_Message value)? message,
    TResult Function(RelayPoolNotification_Shutdown value)? shutdown,
    required TResult orElse(),
  }) {
    if (shutdown != null) {
      return shutdown(this);
    }
    return orElse();
  }
}

abstract class RelayPoolNotification_Shutdown extends RelayPoolNotification {
  const factory RelayPoolNotification_Shutdown() =
      _$RelayPoolNotification_ShutdownImpl;
  const RelayPoolNotification_Shutdown._() : super._();
}
