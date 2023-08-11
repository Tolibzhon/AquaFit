// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_workout_hive_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetWorkoutHiveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutHiveModel> model) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutHiveModel> model)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutHiveModel> model)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkout value) loading,
    required TResult Function(_ErrorWorkout value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkout value)? loading,
    TResult? Function(_ErrorWorkout value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkout value)? loading,
    TResult Function(_ErrorWorkout value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWorkoutHiveStateCopyWith<$Res> {
  factory $GetWorkoutHiveStateCopyWith(
          GetWorkoutHiveState value, $Res Function(GetWorkoutHiveState) then) =
      _$GetWorkoutHiveStateCopyWithImpl<$Res, GetWorkoutHiveState>;
}

/// @nodoc
class _$GetWorkoutHiveStateCopyWithImpl<$Res, $Val extends GetWorkoutHiveState>
    implements $GetWorkoutHiveStateCopyWith<$Res> {
  _$GetWorkoutHiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingWorkoutCopyWith<$Res> {
  factory _$$_LoadingWorkoutCopyWith(
          _$_LoadingWorkout value, $Res Function(_$_LoadingWorkout) then) =
      __$$_LoadingWorkoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingWorkoutCopyWithImpl<$Res>
    extends _$GetWorkoutHiveStateCopyWithImpl<$Res, _$_LoadingWorkout>
    implements _$$_LoadingWorkoutCopyWith<$Res> {
  __$$_LoadingWorkoutCopyWithImpl(
      _$_LoadingWorkout _value, $Res Function(_$_LoadingWorkout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingWorkout implements _LoadingWorkout {
  const _$_LoadingWorkout();

  @override
  String toString() {
    return 'GetWorkoutHiveState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingWorkout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutHiveModel> model) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutHiveModel> model)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutHiveModel> model)? success,
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
    required TResult Function(_LoadingWorkout value) loading,
    required TResult Function(_ErrorWorkout value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkout value)? loading,
    TResult? Function(_ErrorWorkout value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkout value)? loading,
    TResult Function(_ErrorWorkout value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingWorkout implements GetWorkoutHiveState {
  const factory _LoadingWorkout() = _$_LoadingWorkout;
}

/// @nodoc
abstract class _$$_ErrorWorkoutCopyWith<$Res> {
  factory _$$_ErrorWorkoutCopyWith(
          _$_ErrorWorkout value, $Res Function(_$_ErrorWorkout) then) =
      __$$_ErrorWorkoutCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorWorkoutCopyWithImpl<$Res>
    extends _$GetWorkoutHiveStateCopyWithImpl<$Res, _$_ErrorWorkout>
    implements _$$_ErrorWorkoutCopyWith<$Res> {
  __$$_ErrorWorkoutCopyWithImpl(
      _$_ErrorWorkout _value, $Res Function(_$_ErrorWorkout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorWorkout(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorWorkout implements _ErrorWorkout {
  const _$_ErrorWorkout(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GetWorkoutHiveState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorWorkout &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorWorkoutCopyWith<_$_ErrorWorkout> get copyWith =>
      __$$_ErrorWorkoutCopyWithImpl<_$_ErrorWorkout>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutHiveModel> model) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutHiveModel> model)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutHiveModel> model)? success,
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
    required TResult Function(_LoadingWorkout value) loading,
    required TResult Function(_ErrorWorkout value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkout value)? loading,
    TResult? Function(_ErrorWorkout value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkout value)? loading,
    TResult Function(_ErrorWorkout value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorWorkout implements GetWorkoutHiveState {
  const factory _ErrorWorkout(final String error) = _$_ErrorWorkout;

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorWorkoutCopyWith<_$_ErrorWorkout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WorkoutHiveModel> model});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$GetWorkoutHiveStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_Success(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<WorkoutHiveModel>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(final List<WorkoutHiveModel> model) : _model = model;

  final List<WorkoutHiveModel> _model;
  @override
  List<WorkoutHiveModel> get model {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'GetWorkoutHiveState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<WorkoutHiveModel> model) success,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<WorkoutHiveModel> model)? success,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<WorkoutHiveModel> model)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingWorkout value) loading,
    required TResult Function(_ErrorWorkout value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingWorkout value)? loading,
    TResult? Function(_ErrorWorkout value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingWorkout value)? loading,
    TResult Function(_ErrorWorkout value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GetWorkoutHiveState {
  const factory _Success(final List<WorkoutHiveModel> model) = _$_Success;

  List<WorkoutHiveModel> get model;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
