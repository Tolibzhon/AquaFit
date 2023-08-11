// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_workouts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetWorkoutsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutsModel> modal) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutsModel> modal)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutsModel> modal)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkouts value) loading,
    required TResult Function(_ErrorWorkouts value) error,
    required TResult Function(_SuccessWorkouts value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkouts value)? loading,
    TResult? Function(_ErrorWorkouts value)? error,
    TResult? Function(_SuccessWorkouts value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkouts value)? loading,
    TResult Function(_ErrorWorkouts value)? error,
    TResult Function(_SuccessWorkouts value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWorkoutsStateCopyWith<$Res> {
  factory $GetWorkoutsStateCopyWith(
          GetWorkoutsState value, $Res Function(GetWorkoutsState) then) =
      _$GetWorkoutsStateCopyWithImpl<$Res, GetWorkoutsState>;
}

/// @nodoc
class _$GetWorkoutsStateCopyWithImpl<$Res, $Val extends GetWorkoutsState>
    implements $GetWorkoutsStateCopyWith<$Res> {
  _$GetWorkoutsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingWorkoutsCopyWith<$Res> {
  factory _$$_LoadingWorkoutsCopyWith(
          _$_LoadingWorkouts value, $Res Function(_$_LoadingWorkouts) then) =
      __$$_LoadingWorkoutsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingWorkoutsCopyWithImpl<$Res>
    extends _$GetWorkoutsStateCopyWithImpl<$Res, _$_LoadingWorkouts>
    implements _$$_LoadingWorkoutsCopyWith<$Res> {
  __$$_LoadingWorkoutsCopyWithImpl(
      _$_LoadingWorkouts _value, $Res Function(_$_LoadingWorkouts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingWorkouts implements _LoadingWorkouts {
  const _$_LoadingWorkouts();

  @override
  String toString() {
    return 'GetWorkoutsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingWorkouts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutsModel> modal) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutsModel> modal)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutsModel> modal)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkouts value) loading,
    required TResult Function(_ErrorWorkouts value) error,
    required TResult Function(_SuccessWorkouts value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkouts value)? loading,
    TResult? Function(_ErrorWorkouts value)? error,
    TResult? Function(_SuccessWorkouts value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkouts value)? loading,
    TResult Function(_ErrorWorkouts value)? error,
    TResult Function(_SuccessWorkouts value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingWorkouts implements GetWorkoutsState {
  const factory _LoadingWorkouts() = _$_LoadingWorkouts;
}

/// @nodoc
abstract class _$$_ErrorWorkoutsCopyWith<$Res> {
  factory _$$_ErrorWorkoutsCopyWith(
          _$_ErrorWorkouts value, $Res Function(_$_ErrorWorkouts) then) =
      __$$_ErrorWorkoutsCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorWorkoutsCopyWithImpl<$Res>
    extends _$GetWorkoutsStateCopyWithImpl<$Res, _$_ErrorWorkouts>
    implements _$$_ErrorWorkoutsCopyWith<$Res> {
  __$$_ErrorWorkoutsCopyWithImpl(
      _$_ErrorWorkouts _value, $Res Function(_$_ErrorWorkouts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorWorkouts(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorWorkouts implements _ErrorWorkouts {
  const _$_ErrorWorkouts(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GetWorkoutsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorWorkouts &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorWorkoutsCopyWith<_$_ErrorWorkouts> get copyWith =>
      __$$_ErrorWorkoutsCopyWithImpl<_$_ErrorWorkouts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutsModel> modal) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutsModel> modal)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutsModel> modal)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkouts value) loading,
    required TResult Function(_ErrorWorkouts value) error,
    required TResult Function(_SuccessWorkouts value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkouts value)? loading,
    TResult? Function(_ErrorWorkouts value)? error,
    TResult? Function(_SuccessWorkouts value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkouts value)? loading,
    TResult Function(_ErrorWorkouts value)? error,
    TResult Function(_SuccessWorkouts value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorWorkouts implements GetWorkoutsState {
  const factory _ErrorWorkouts(final String error) = _$_ErrorWorkouts;

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorWorkoutsCopyWith<_$_ErrorWorkouts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessWorkoutsCopyWith<$Res> {
  factory _$$_SuccessWorkoutsCopyWith(
          _$_SuccessWorkouts value, $Res Function(_$_SuccessWorkouts) then) =
      __$$_SuccessWorkoutsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WorkoutsModel> modal});
}

/// @nodoc
class __$$_SuccessWorkoutsCopyWithImpl<$Res>
    extends _$GetWorkoutsStateCopyWithImpl<$Res, _$_SuccessWorkouts>
    implements _$$_SuccessWorkoutsCopyWith<$Res> {
  __$$_SuccessWorkoutsCopyWithImpl(
      _$_SuccessWorkouts _value, $Res Function(_$_SuccessWorkouts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modal = null,
  }) {
    return _then(_$_SuccessWorkouts(
      null == modal
          ? _value._modal
          : modal // ignore: cast_nullable_to_non_nullable
              as List<WorkoutsModel>,
    ));
  }
}

/// @nodoc

class _$_SuccessWorkouts implements _SuccessWorkouts {
  const _$_SuccessWorkouts(final List<WorkoutsModel> modal) : _modal = modal;

  final List<WorkoutsModel> _modal;
  @override
  List<WorkoutsModel> get modal {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modal);
  }

  @override
  String toString() {
    return 'GetWorkoutsState.success(modal: $modal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessWorkouts &&
            const DeepCollectionEquality().equals(other._modal, _modal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_modal));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessWorkoutsCopyWith<_$_SuccessWorkouts> get copyWith =>
      __$$_SuccessWorkoutsCopyWithImpl<_$_SuccessWorkouts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutsModel> modal) success,
  }) {
    return success(modal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutsModel> modal)? success,
  }) {
    return success?.call(modal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutsModel> modal)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(modal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkouts value) loading,
    required TResult Function(_ErrorWorkouts value) error,
    required TResult Function(_SuccessWorkouts value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkouts value)? loading,
    TResult? Function(_ErrorWorkouts value)? error,
    TResult? Function(_SuccessWorkouts value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkouts value)? loading,
    TResult Function(_ErrorWorkouts value)? error,
    TResult Function(_SuccessWorkouts value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessWorkouts implements GetWorkoutsState {
  const factory _SuccessWorkouts(final List<WorkoutsModel> modal) =
      _$_SuccessWorkouts;

  List<WorkoutsModel> get modal;
  @JsonKey(ignore: true)
  _$$_SuccessWorkoutsCopyWith<_$_SuccessWorkouts> get copyWith =>
      throw _privateConstructorUsedError;
}
