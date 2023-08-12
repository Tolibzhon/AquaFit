import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/feature/plan/data/domain/get_workouts_repo.dart';
import 'package:aqua_fit/feature/plan/data/domain/local_done_exercise_ds.dart';
import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_workouts_cubit.freezed.dart';

class GetWorkoutsCubit extends Cubit<GetWorkoutsState> {
  GetWorkoutsCubit(this.repo) : super(const GetWorkoutsState.loading());
  final GetWorkoutsRepo repo;
  Future<void> getWorkouts() async {
    emit(const GetWorkoutsState.loading());
    try {
      final workouts = await repo.getWorkouts();
      final isBuy = await Premium.getSubscrp();
      final finishedWorkouts = await LocalDoneDaysDataSource.getDoneDays();

      for (var i = 0; i < workouts.length; i++) {
        int finishedDaysCount = 0;
        for (var j = 0; j < workouts[i].days.length; j++) {
          if (finishedWorkouts
              .contains('${workouts[i].title}${workouts[i].days[j].day}')) {
            workouts[i].days[j].dayState = DayState.finished;
            finishedDaysCount++;
          } else {
            if (j > 0) {
              if (workouts[i].days[j - 1].dayState == DayState.finished) {
                workouts[i].days[j].dayState = DayState.available;
              }
            } else {
              workouts[i].days[j].dayState = DayState.available;
            }
            if (!isBuy && j > 2) {
              workouts[i].days[j].dayState = DayState.blocked;
            }
          }
        }
        workouts[i].progress = finishedDaysCount / workouts[i].days.length;
        workouts[i].daysLeft = workouts[i].days.length - finishedDaysCount;
        workouts[i].percentage =
            ((finishedDaysCount / workouts[i].days.length) * 100).toInt();
      }
      emit(GetWorkoutsState.success(workouts));
    } catch (e) {
      emit(
        GetWorkoutsState.error(e.toString()),
      );
    }
  }
}

@freezed
class GetWorkoutsState with _$GetWorkoutsState {
  const factory GetWorkoutsState.loading() = _LoadingWorkouts;
  const factory GetWorkoutsState.error(String error) = _ErrorWorkouts;
  const factory GetWorkoutsState.success(List<WorkoutsModel> modal) =
      _SuccessWorkouts;
}
