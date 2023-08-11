part of 'set_workout_hive_cubit.dart';

@freezed
class SetWorkoutHiveState with _$SetWorkoutHiveState {
  const factory SetWorkoutHiveState.initial() = _InitialSetWorkoutHiveState;

  const factory SetWorkoutHiveState.loading() = _LoadingSetWorkoutHiveState;
  const factory SetWorkoutHiveState.error(String error) = _ErrorSetWorkoutHiveState;
  const factory SetWorkoutHiveState.success() = _SuccessSetWorkoutHiveState;


  const SetWorkoutHiveState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
      
}
