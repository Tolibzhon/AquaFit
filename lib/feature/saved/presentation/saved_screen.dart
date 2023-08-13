import 'package:aqua_fit/feature/plan/data/cubit/get_workouts_cubit.dart';
import 'package:aqua_fit/feature/plan/data/domain/get_workouts_repo.dart';
import 'package:aqua_fit/feature/plan/presentation/workout_screen.dart';
import 'package:aqua_fit/feature/saved/logic/cubits/delete_workout_cubit/delete_workout_cubit.dart';
import 'package:aqua_fit/feature/saved/logic/cubits/get_workout_hive_cubit/get_workout_hive_cubit.dart';
import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:aqua_fit/feature/saved/presentation/widget/widget_saved.dart';
import 'package:aqua_fit/feature/widgets/app_error_text.dart';
import 'package:aqua_fit/feature/widgets/app_indicator.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:aqua_fit/helpers/saved_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String> listIsChekTitle = [];
  List<String> listIsChekDay = [];

  @override
  void initState() {
    context.read<GetWorkoutHiveCubit>().getWorkout();
    savedData();
    super.initState();
  }

  Future<void> savedData() async {
    List<String> listIsChekTitleSavedData = await SavedData.getIsChekTitle();
    List<String> listIsChekDaySavedData = await SavedData.getIsChekDay();
    setState(() {
      listIsChekTitle = listIsChekTitleSavedData;
      listIsChekDay = listIsChekDaySavedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved workouts'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetWorkoutsCubit(GetWorkoutsRepoImpl())..getWorkouts(),
          ),
          BlocProvider(
            create: (context) => DeleteWorkoutCubit(WorkoutHiveRepoImpl()),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text(
                'Create your own plan from favorite trainings',
                style:
                    AppTextStyles.s16W500(color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(height: 20),
              BlocBuilder<GetWorkoutHiveCubit, GetWorkoutHiveState>(
                builder: (context, state) {
                  return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) {
                        return model.isNotEmpty
                            ? BlocBuilder<GetWorkoutsCubit, GetWorkoutsState>(
                                builder: (context, state) {
                                  return state.when(
                                      loading: () => const AppIndicator(),
                                      error: (error) =>
                                          AppErrorText(error: error),
                                      success: (models) {
                                        return Expanded(
                                          child: ListView.separated(
                                              shrinkWrap: true,
                                              itemCount: model.length,
                                              separatorBuilder: (context,
                                                      index) =>
                                                  const SizedBox(height: 16),
                                              itemBuilder: (context, index) {
                                                return BlocConsumer<
                                                    DeleteWorkoutCubit,
                                                    DeleteWorkoutState>(
                                                  listener: (context, state) {
                                                    state.whenOrNull(
                                                      success: () {
                                                        context
                                                            .read<
                                                                GetWorkoutHiveCubit>()
                                                            .getWorkout();
                                                      },
                                                    );
                                                  },
                                                  builder: (context, state) {
                                                    return WidgetSaved(
                                                        onTapIcon: () async {
                                                          listIsChekTitle
                                                              .remove(
                                                                  model[index]
                                                                      .title);
                                                          listIsChekDay.remove(
                                                              '${model[index].day}');

                                                          await SavedData
                                                              .setIsChekTitle(
                                                                  listIsChekTitle);

                                                          await SavedData
                                                              .setIsChekDay(
                                                                  listIsChekDay);

                                                          context
                                                              .read<
                                                                  DeleteWorkoutCubit>()
                                                              .delete(
                                                                model[index].id,
                                                              );
                                                        },
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => WorkoutScreen(
                                                                  index: model[
                                                                          index]
                                                                      .index,
                                                                  model: models[
                                                                      model[index]
                                                                          .index]),
                                                            ),
                                                          );
                                                        },
                                                        model: model[index]);
                                                  },
                                                );
                                              }),
                                        );
                                      });
                                },
                              )
                            : Expanded(
                                child: Center(
                                  child: Text(
                                    'No saved workouts yet',
                                    style: AppTextStyles.s24W500(
                                        color: Colors.black54),
                                  ),
                                ),
                              );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
