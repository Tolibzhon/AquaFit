import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_workout_hive_state.dart';
part 'set_workout_hive_cubit.freezed.dart';

class SetWorkoutHiveCubit extends Cubit<SetWorkoutHiveState> {
  SetWorkoutHiveCubit(
    this.workoutRepo,
  ) : super(const SetWorkoutHiveState.initial());

  final WorkoutHiveRepo workoutRepo;

  setWorkout(WorkoutHiveModel workoutHiveModel) async {
    emit(const SetWorkoutHiveState.loading());
    try {
      await workoutRepo.setWorkout(workoutHiveModel);
      emit(const SetWorkoutHiveState.success());
    } catch (e) {
      emit(SetWorkoutHiveState.error(e.toString()));
    }
  }


}
