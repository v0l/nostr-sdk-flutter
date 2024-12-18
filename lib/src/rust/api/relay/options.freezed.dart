// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionMode {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() direct,
    required TResult Function(String addr) proxy,
    required TResult Function(String? customPath) tor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? direct,
    TResult? Function(String addr)? proxy,
    TResult? Function(String? customPath)? tor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? direct,
    TResult Function(String addr)? proxy,
    TResult Function(String? customPath)? tor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionMode_Direct value) direct,
    required TResult Function(ConnectionMode_Proxy value) proxy,
    required TResult Function(ConnectionMode_Tor value) tor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionMode_Direct value)? direct,
    TResult? Function(ConnectionMode_Proxy value)? proxy,
    TResult? Function(ConnectionMode_Tor value)? tor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionMode_Direct value)? direct,
    TResult Function(ConnectionMode_Proxy value)? proxy,
    TResult Function(ConnectionMode_Tor value)? tor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionModeCopyWith<$Res> {
  factory $ConnectionModeCopyWith(
          ConnectionMode value, $Res Function(ConnectionMode) then) =
      _$ConnectionModeCopyWithImpl<$Res, ConnectionMode>;
}

/// @nodoc
class _$ConnectionModeCopyWithImpl<$Res, $Val extends ConnectionMode>
    implements $ConnectionModeCopyWith<$Res> {
  _$ConnectionModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectionMode_DirectImplCopyWith<$Res> {
  factory _$$ConnectionMode_DirectImplCopyWith(
          _$ConnectionMode_DirectImpl value,
          $Res Function(_$ConnectionMode_DirectImpl) then) =
      __$$ConnectionMode_DirectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionMode_DirectImplCopyWithImpl<$Res>
    extends _$ConnectionModeCopyWithImpl<$Res, _$ConnectionMode_DirectImpl>
    implements _$$ConnectionMode_DirectImplCopyWith<$Res> {
  __$$ConnectionMode_DirectImplCopyWithImpl(_$ConnectionMode_DirectImpl _value,
      $Res Function(_$ConnectionMode_DirectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectionMode_DirectImpl extends ConnectionMode_Direct {
  const _$ConnectionMode_DirectImpl() : super._();

  @override
  String toString() {
    return 'ConnectionMode.direct()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionMode_DirectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() direct,
    required TResult Function(String addr) proxy,
    required TResult Function(String? customPath) tor,
  }) {
    return direct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? direct,
    TResult? Function(String addr)? proxy,
    TResult? Function(String? customPath)? tor,
  }) {
    return direct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? direct,
    TResult Function(String addr)? proxy,
    TResult Function(String? customPath)? tor,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionMode_Direct value) direct,
    required TResult Function(ConnectionMode_Proxy value) proxy,
    required TResult Function(ConnectionMode_Tor value) tor,
  }) {
    return direct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionMode_Direct value)? direct,
    TResult? Function(ConnectionMode_Proxy value)? proxy,
    TResult? Function(ConnectionMode_Tor value)? tor,
  }) {
    return direct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionMode_Direct value)? direct,
    TResult Function(ConnectionMode_Proxy value)? proxy,
    TResult Function(ConnectionMode_Tor value)? tor,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct(this);
    }
    return orElse();
  }
}

abstract class ConnectionMode_Direct extends ConnectionMode {
  const factory ConnectionMode_Direct() = _$ConnectionMode_DirectImpl;
  const ConnectionMode_Direct._() : super._();
}

/// @nodoc
abstract class _$$ConnectionMode_ProxyImplCopyWith<$Res> {
  factory _$$ConnectionMode_ProxyImplCopyWith(_$ConnectionMode_ProxyImpl value,
          $Res Function(_$ConnectionMode_ProxyImpl) then) =
      __$$ConnectionMode_ProxyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String addr});
}

/// @nodoc
class __$$ConnectionMode_ProxyImplCopyWithImpl<$Res>
    extends _$ConnectionModeCopyWithImpl<$Res, _$ConnectionMode_ProxyImpl>
    implements _$$ConnectionMode_ProxyImplCopyWith<$Res> {
  __$$ConnectionMode_ProxyImplCopyWithImpl(_$ConnectionMode_ProxyImpl _value,
      $Res Function(_$ConnectionMode_ProxyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = null,
  }) {
    return _then(_$ConnectionMode_ProxyImpl(
      addr: null == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectionMode_ProxyImpl extends ConnectionMode_Proxy {
  const _$ConnectionMode_ProxyImpl({required this.addr}) : super._();

  /// Socket addr (i.e. 127.0.0.1:9050)
  @override
  final String addr;

  @override
  String toString() {
    return 'ConnectionMode.proxy(addr: $addr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionMode_ProxyImpl &&
            (identical(other.addr, addr) || other.addr == addr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addr);

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionMode_ProxyImplCopyWith<_$ConnectionMode_ProxyImpl>
      get copyWith =>
          __$$ConnectionMode_ProxyImplCopyWithImpl<_$ConnectionMode_ProxyImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() direct,
    required TResult Function(String addr) proxy,
    required TResult Function(String? customPath) tor,
  }) {
    return proxy(addr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? direct,
    TResult? Function(String addr)? proxy,
    TResult? Function(String? customPath)? tor,
  }) {
    return proxy?.call(addr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? direct,
    TResult Function(String addr)? proxy,
    TResult Function(String? customPath)? tor,
    required TResult orElse(),
  }) {
    if (proxy != null) {
      return proxy(addr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionMode_Direct value) direct,
    required TResult Function(ConnectionMode_Proxy value) proxy,
    required TResult Function(ConnectionMode_Tor value) tor,
  }) {
    return proxy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionMode_Direct value)? direct,
    TResult? Function(ConnectionMode_Proxy value)? proxy,
    TResult? Function(ConnectionMode_Tor value)? tor,
  }) {
    return proxy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionMode_Direct value)? direct,
    TResult Function(ConnectionMode_Proxy value)? proxy,
    TResult Function(ConnectionMode_Tor value)? tor,
    required TResult orElse(),
  }) {
    if (proxy != null) {
      return proxy(this);
    }
    return orElse();
  }
}

abstract class ConnectionMode_Proxy extends ConnectionMode {
  const factory ConnectionMode_Proxy({required final String addr}) =
      _$ConnectionMode_ProxyImpl;
  const ConnectionMode_Proxy._() : super._();

  /// Socket addr (i.e. 127.0.0.1:9050)
  String get addr;

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionMode_ProxyImplCopyWith<_$ConnectionMode_ProxyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionMode_TorImplCopyWith<$Res> {
  factory _$$ConnectionMode_TorImplCopyWith(_$ConnectionMode_TorImpl value,
          $Res Function(_$ConnectionMode_TorImpl) then) =
      __$$ConnectionMode_TorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? customPath});
}

/// @nodoc
class __$$ConnectionMode_TorImplCopyWithImpl<$Res>
    extends _$ConnectionModeCopyWithImpl<$Res, _$ConnectionMode_TorImpl>
    implements _$$ConnectionMode_TorImplCopyWith<$Res> {
  __$$ConnectionMode_TorImplCopyWithImpl(_$ConnectionMode_TorImpl _value,
      $Res Function(_$ConnectionMode_TorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customPath = freezed,
  }) {
    return _then(_$ConnectionMode_TorImpl(
      customPath: freezed == customPath
          ? _value.customPath
          : customPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConnectionMode_TorImpl extends ConnectionMode_Tor {
  const _$ConnectionMode_TorImpl({this.customPath}) : super._();

  /// Path where to store data
  ///
  /// This is required for `android` and `ios` targets!
  @override
  final String? customPath;

  @override
  String toString() {
    return 'ConnectionMode.tor(customPath: $customPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionMode_TorImpl &&
            (identical(other.customPath, customPath) ||
                other.customPath == customPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customPath);

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionMode_TorImplCopyWith<_$ConnectionMode_TorImpl> get copyWith =>
      __$$ConnectionMode_TorImplCopyWithImpl<_$ConnectionMode_TorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() direct,
    required TResult Function(String addr) proxy,
    required TResult Function(String? customPath) tor,
  }) {
    return tor(customPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? direct,
    TResult? Function(String addr)? proxy,
    TResult? Function(String? customPath)? tor,
  }) {
    return tor?.call(customPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? direct,
    TResult Function(String addr)? proxy,
    TResult Function(String? customPath)? tor,
    required TResult orElse(),
  }) {
    if (tor != null) {
      return tor(customPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionMode_Direct value) direct,
    required TResult Function(ConnectionMode_Proxy value) proxy,
    required TResult Function(ConnectionMode_Tor value) tor,
  }) {
    return tor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionMode_Direct value)? direct,
    TResult? Function(ConnectionMode_Proxy value)? proxy,
    TResult? Function(ConnectionMode_Tor value)? tor,
  }) {
    return tor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionMode_Direct value)? direct,
    TResult Function(ConnectionMode_Proxy value)? proxy,
    TResult Function(ConnectionMode_Tor value)? tor,
    required TResult orElse(),
  }) {
    if (tor != null) {
      return tor(this);
    }
    return orElse();
  }
}

abstract class ConnectionMode_Tor extends ConnectionMode {
  const factory ConnectionMode_Tor({final String? customPath}) =
      _$ConnectionMode_TorImpl;
  const ConnectionMode_Tor._() : super._();

  /// Path where to store data
  ///
  /// This is required for `android` and `ios` targets!
  String? get customPath;

  /// Create a copy of ConnectionMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionMode_TorImplCopyWith<_$ConnectionMode_TorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
