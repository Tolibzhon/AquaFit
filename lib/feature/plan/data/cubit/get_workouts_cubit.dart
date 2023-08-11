import 'package:aqua_fit/feature/plan/data/domain/get_workouts_repo.dart';
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

      // if (duration.isNotEmpty) {
      //   workouts.removeWhere(
      //       (element) => !duration.contains(element.duration.toString()));
      // }
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
