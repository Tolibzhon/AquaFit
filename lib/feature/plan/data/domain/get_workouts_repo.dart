import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class GetWorkoutsRepo {
  Future<List<WorkoutsModel>> getWorkouts();
}

class GetWorkoutsRepoImpl implements GetWorkoutsRepo {
  @override
  Future<List<WorkoutsModel>> getWorkouts() async {
    final massage = <WorkoutsModel>[];
    final snapshot = await FirebaseDatabase.instance.ref('aqua').get();

    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final workouts = WorkoutsModel.fromJson(value);
        massage.add(workouts);
      });

    }
    return massage;
  }
}
