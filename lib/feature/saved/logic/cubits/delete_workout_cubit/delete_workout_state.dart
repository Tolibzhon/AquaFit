part of 'delete_workout_cubit.dart';

@freezed
class DeleteWorkoutState with _$DeleteWorkoutState {
  const factory DeleteWorkoutState.initial() = _Initial;
  const factory DeleteWorkoutState.loading() = _Loading;
  const factory DeleteWorkoutState.error(String error) = _Error;
  const factory DeleteWorkoutState.success() = _Success;

  const DeleteWorkoutState._();
  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
