import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_workout_state.dart';
part 'delete_workout_cubit.freezed.dart';

class DeleteWorkoutCubit extends Cubit<DeleteWorkoutState> {
  DeleteWorkoutCubit(this.repo) : super(const DeleteWorkoutState.initial());

  final WorkoutHiveRepo repo;

  delete(int id) async {
    emit(const DeleteWorkoutState.loading());
    try {
      await repo.deleteWorkout(id);
      emit(const DeleteWorkoutState.success());
    } catch (e) {
      emit(DeleteWorkoutState.error(e.toString()));
    }
  }
}
