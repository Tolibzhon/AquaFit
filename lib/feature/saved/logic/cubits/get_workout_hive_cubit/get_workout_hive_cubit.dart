import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_workout_hive_state.dart';
part 'get_workout_hive_cubit.freezed.dart';

class GetWorkoutHiveCubit extends Cubit<GetWorkoutHiveState> {
  GetWorkoutHiveCubit(this.workoutRepo)
      : super(const GetWorkoutHiveState.loading());

  final WorkoutHiveRepo workoutRepo;

  getWorkout() async {
    emit(const GetWorkoutHiveState.loading());
    try {
      final financeList = await workoutRepo.getWorkout();
      emit(GetWorkoutHiveState.success(financeList.reversed.toList()));
    } catch (e) {
      emit(GetWorkoutHiveState.error(e.toString()));
    }
  }

  getWorkoutStatistic() async {
    emit(const GetWorkoutHiveState.loading());

    // final dateNow = DateTime.now();
    try {
      final dreamsList = await workoutRepo.getWorkout();
      // List<List<WorkoutHiveModel>> dividedList = [];

      List<WorkoutHiveModel> averagedModels =
          groupAndCalculateAverage(dreamsList);

      // Set<String> uniqueDates = Set<String>();
      // List<WorkoutHiveModel> filteredData = [];

      // for (var item in dreamsList) {
      //   if (!uniqueDates.contains(dateFormatMain.format(item.dateNow))) {
      //     uniqueDates.add(dateFormatMain.format(item.dateNow));
      //     filteredData.add(item);
      //   }
      // }
      // int n = filter - averagedModels.length;
      // if (averagedModels.isNotEmpty) {
      //   for (var i = 1; i <= n; i++) {
      //     averagedModels.insert(
      //       0,
      //       WorkoutHiveModel(
      //           id: 0,
      //           dateNow: averagedModels.first.dateNow.subtract(Duration(days: 1)),
      //           dateDuration: 0,
      //           dateTime: '',
      //           quality: 0, //add
      //           percentNum: 0),
      //     );
      //   }
      // }
      //jj

      emit(GetWorkoutHiveState.success(averagedModels));
    } catch (e) {
      emit(GetWorkoutHiveState.error(e.toString()));
    }
  }
}

List<WorkoutHiveModel> groupAndCalculateAverage(List<WorkoutHiveModel> models) {
  List<WorkoutHiveModel> averagedData = [];

  // Перебираем модели
  for (var model in models) {
    // Ищем модель с той же датой в результирующем списке
    var existingModel = averagedData.firstWhere(
      (m) => m.date.day == model.date.day,
      orElse: () => WorkoutHiveModel(
        id: model.id,
        day: model.day,
        date: model.date,
        calories: model.calories,
        duration: model.duration,
        title: model.title,
      ),
    );

    // Обновляем значения
    existingModel.calories += model.calories;
    // existingModel.dateDuration ~/= 2; // Вычисляем среднее значение

    if (!averagedData.contains(existingModel)) {
      averagedData.add(existingModel);
    }
  }

  return averagedData;
}
