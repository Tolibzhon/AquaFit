part of 'get_workout_hive_cubit.dart';

@freezed
class GetWorkoutHiveState with _$GetWorkoutHiveState {
  const factory GetWorkoutHiveState.loading() = _LoadingWorkout;
  const factory GetWorkoutHiveState.error(String error) = _ErrorWorkout;
  const factory GetWorkoutHiveState.success(List<WorkoutHiveModel> model) =
      _Success;

}
