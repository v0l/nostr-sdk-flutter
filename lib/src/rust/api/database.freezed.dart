// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveEventStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(RejectedReason field0) rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(RejectedReason field0)? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(RejectedReason field0)? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveEventStatus_Success value) success,
    required TResult Function(SaveEventStatus_Rejected value) rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveEventStatus_Success value)? success,
    TResult? Function(SaveEventStatus_Rejected value)? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveEventStatus_Success value)? success,
    TResult Function(SaveEventStatus_Rejected value)? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveEventStatusCopyWith<$Res> {
  factory $SaveEventStatusCopyWith(
          SaveEventStatus value, $Res Function(SaveEventStatus) then) =
      _$SaveEventStatusCopyWithImpl<$Res, SaveEventStatus>;
}

/// @nodoc
class _$SaveEventStatusCopyWithImpl<$Res, $Val extends SaveEventStatus>
    implements $SaveEventStatusCopyWith<$Res> {
  _$SaveEventStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveEventStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SaveEventStatus_SuccessImplCopyWith<$Res> {
  factory _$$SaveEventStatus_SuccessImplCopyWith(
          _$SaveEventStatus_SuccessImpl value,
          $Res Function(_$SaveEventStatus_SuccessImpl) then) =
      __$$SaveEventStatus_SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveEventStatus_SuccessImplCopyWithImpl<$Res>
    extends _$SaveEventStatusCopyWithImpl<$Res, _$SaveEventStatus_SuccessImpl>
    implements _$$SaveEventStatus_SuccessImplCopyWith<$Res> {
  __$$SaveEventStatus_SuccessImplCopyWithImpl(
      _$SaveEventStatus_SuccessImpl _value,
      $Res Function(_$SaveEventStatus_SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveEventStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveEventStatus_SuccessImpl extends SaveEventStatus_Success {
  const _$SaveEventStatus_SuccessImpl() : super._();

  @override
  String toString() {
    return 'SaveEventStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveEventStatus_SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(RejectedReason field0) rejected,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(RejectedReason field0)? rejected,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(RejectedReason field0)? rejected,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveEventStatus_Success value) success,
    required TResult Function(SaveEventStatus_Rejected value) rejected,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveEventStatus_Success value)? success,
    TResult? Function(SaveEventStatus_Rejected value)? rejected,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveEventStatus_Success value)? success,
    TResult Function(SaveEventStatus_Rejected value)? rejected,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SaveEventStatus_Success extends SaveEventStatus {
  const factory SaveEventStatus_Success() = _$SaveEventStatus_SuccessImpl;
  const SaveEventStatus_Success._() : super._();
}

/// @nodoc
abstract class _$$SaveEventStatus_RejectedImplCopyWith<$Res> {
  factory _$$SaveEventStatus_RejectedImplCopyWith(
          _$SaveEventStatus_RejectedImpl value,
          $Res Function(_$SaveEventStatus_RejectedImpl) then) =
      __$$SaveEventStatus_RejectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RejectedReason field0});
}

/// @nodoc
class __$$SaveEventStatus_RejectedImplCopyWithImpl<$Res>
    extends _$SaveEventStatusCopyWithImpl<$Res, _$SaveEventStatus_RejectedImpl>
    implements _$$SaveEventStatus_RejectedImplCopyWith<$Res> {
  __$$SaveEventStatus_RejectedImplCopyWithImpl(
      _$SaveEventStatus_RejectedImpl _value,
      $Res Function(_$SaveEventStatus_RejectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveEventStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$SaveEventStatus_RejectedImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as RejectedReason,
    ));
  }
}

/// @nodoc

class _$SaveEventStatus_RejectedImpl extends SaveEventStatus_Rejected {
  const _$SaveEventStatus_RejectedImpl(this.field0) : super._();

  @override
  final RejectedReason field0;

  @override
  String toString() {
    return 'SaveEventStatus.rejected(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveEventStatus_RejectedImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of SaveEventStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveEventStatus_RejectedImplCopyWith<_$SaveEventStatus_RejectedImpl>
      get copyWith => __$$SaveEventStatus_RejectedImplCopyWithImpl<
          _$SaveEventStatus_RejectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(RejectedReason field0) rejected,
  }) {
    return rejected(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(RejectedReason field0)? rejected,
  }) {
    return rejected?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(RejectedReason field0)? rejected,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveEventStatus_Success value) success,
    required TResult Function(SaveEventStatus_Rejected value) rejected,
  }) {
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveEventStatus_Success value)? success,
    TResult? Function(SaveEventStatus_Rejected value)? rejected,
  }) {
    return rejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveEventStatus_Success value)? success,
    TResult Function(SaveEventStatus_Rejected value)? rejected,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class SaveEventStatus_Rejected extends SaveEventStatus {
  const factory SaveEventStatus_Rejected(final RejectedReason field0) =
      _$SaveEventStatus_RejectedImpl;
  const SaveEventStatus_Rejected._() : super._();

  RejectedReason get field0;

  /// Create a copy of SaveEventStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveEventStatus_RejectedImplCopyWith<_$SaveEventStatus_RejectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
