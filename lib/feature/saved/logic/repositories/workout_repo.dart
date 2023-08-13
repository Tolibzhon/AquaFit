import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class WorkoutHiveRepo {
  Future<List<WorkoutHiveModel>> getWorkout();
  Future<void> setWorkout(WorkoutHiveModel workoutHiveModel);
  Future<void> deleteWorkout(int id);
}

class WorkoutHiveRepoImpl implements WorkoutHiveRepo {
  @override
  Future<List<WorkoutHiveModel>> getWorkout() async {
    final workoutBox = await Hive.openBox<WorkoutHiveModel>('WorkoutBox');
    return workoutBox.values.toList();
  }

  @override
  Future<void> setWorkout(WorkoutHiveModel workoutHiveModel) async {
    final workoutBox = await Hive.openBox<WorkoutHiveModel>('WorkoutBox');
    await workoutBox.add(workoutHiveModel);
  }

  @override
  Future<void> deleteWorkout(int id) async {
    final workoutBox = await Hive.openBox<WorkoutHiveModel>('WorkoutBox');
    final workoutModel =
        workoutBox.values.toList().singleWhere((e) => e.id == id);
    await workoutModel.delete();
    await workoutBox.compact();
  }
}
