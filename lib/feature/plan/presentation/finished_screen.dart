import 'package:aqua_fit/feature/plan/data/domain/local_done_exercise_ds.dart';
import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/saved/logic/cubits/set_workout_hive_cubit/set_workout_hive_cubit.dart';
import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:aqua_fit/feature/widgets/buttom_navigator.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:aqua_fit/helpers/saved_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedScreen extends StatefulWidget {
  const FinishedScreen({
    super.key,
    required this.title,
    required this.calories,
    required this.day,
    required this.duration,
    required this.index,
    required this.dayModel,
  });
  final String title;
  final int calories;
  final int day;
  final int duration;
  final int index;
  final Day dayModel;

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  int workouts = 0;

  late int minutes = widget.duration ~/ 60;
  late int seconds = widget.duration % 60;

  List<String> listTitle = [];
  List<String> listDay = [];

  List<String> listIsChekTitle = [];
  List<String> listIsChekDay = [];
  int day1 = 0;
  int day2 = 0;
  int day3 = 0;
  int day4 = 0;
  int day5 = 0;
  int day6 = 0;
  int day7 = 0;
  @override
  void initState() {
    savedData();
    super.initState();
  }

  Future<void> savedData() async {
    int day1SavedData = await SavedData.getOne();
    int day2SavedData = await SavedData.getTwo();
    int day3SavedData = await SavedData.getThree();
    int day4SavedData = await SavedData.getFour();
    int day5SavedData = await SavedData.getFive();
    int day6SavedData = await SavedData.getSix();
    int day7SavedData = await SavedData.getSeven();

    int workoutsSavedData = await SavedData.getWorkouts();
    List<String> listIsChekTitleSavedData = await SavedData.getIsChekTitle();
    List<String> listIsChekDaySavedData = await SavedData.getIsChekDay();
    List<String> listTitleSavedData = await SavedData.getChekTitle();
    List<String> listDaySavedData = await SavedData.getChekDay();
    setState(() {
      day1 = day1SavedData;
      day2 = day2SavedData;
      day3 = day3SavedData;
      day4 = day4SavedData;
      day5 = day5SavedData;
      day6 = day6SavedData;
      day7 = day7SavedData;

      workouts = workoutsSavedData;
      listIsChekTitle = listIsChekTitleSavedData;
      listIsChekDay = listIsChekDaySavedData;
      listTitle = listTitleSavedData;
      listDay = listDaySavedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SetWorkoutHiveCubit(WorkoutHiveRepoImpl()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, right: 25, left: 25),
                      width: getWidth(context),
                      height: 593,
                      child: Container(
                        height: getHeight(context),
                        width: getWidth(context),
                        decoration: BoxDecoration(
                          color: AppColors.color0033EABlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            Image.asset(AppImages.star1, width: 100),
                            Image.asset(AppImages.congrats, width: 200),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      minutes < 10 ? '0$minutes:' : '$minutes:',
                                      style: AppTextStyles.s28W600(
                                          color: AppColors.white),
                                    ),
                                    Text(
                                      seconds < 10 ? '0$seconds' : '$seconds',
                                      style: AppTextStyles.s28W600(
                                          color: AppColors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${widget.calories}',
                                  style: AppTextStyles.s28W600(
                                      color: Colors.white),
                                ),
                                Text(
                                  '${widget.day}th',
                                  style: AppTextStyles.s28W600(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Duration',
                                  style: AppTextStyles.s15W700(
                                      color: Colors.white),
                                ),
                                Text(
                                  'Kcal',
                                  style: AppTextStyles.s15W700(
                                      color: Colors.white),
                                ),
                                Text(
                                  'Day',
                                  style: AppTextStyles.s15W700(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            BlocConsumer<SetWorkoutHiveCubit,
                                SetWorkoutHiveState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  success: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavigatorScreen(
                                          index: 2,
                                        ),
                                      ),
                                      (protected) => false,
                                    );
                                  },
                                );
                              },
                              builder: (context, state) {
                                bool containsSimilarTitle = listIsChekTitle
                                        .any((e) => e == widget.title) &&
                                    listIsChekDay
                                        .any((e) => e == '${widget.day}');
                                return CustomButton(
                                  onPressed: containsSimilarTitle == false
                                      ? () async {
                                          listIsChekTitle.add(widget.title);
                                          listIsChekDay.add('${widget.day}');

                                          workouts++;
                                          await SavedData.setIsChekTitle(
                                              listIsChekTitle);
                                          await SavedData.setIsChekDay(
                                              listIsChekDay);

                                          await SavedData.setWorkouts(workouts);

                                          listTitle.add(widget.title);
                                          listDay.add('${widget.day}');
                                          await SavedData.setChekTitle(
                                              listTitle);
                                          await SavedData.setChekDay(listDay);

                                          if (widget.title ==
                                              'Full Body Workout') {
                                            if (day1 < 7) {
                                              day1++;
                                              await SavedData.setOne(day1);
                                            }
                                          } else if (widget.title ==
                                              'Cardio Intensity') {
                                            if (day2 < 7) {
                                              day2++;
                                              await SavedData.setTwo(day2);
                                            }
                                          } else if (widget.title ==
                                              'Strength Training') {
                                            if (day3 < 7) {
                                              day3++;
                                              await SavedData.setThree(day3);
                                            }
                                          } else if (widget.title ==
                                              'Yoga and Meditation') {
                                            if (day4 < 7) {
                                              day4++;
                                              await SavedData.setFour(day4);
                                            }
                                          } else if (widget.title ==
                                              'Strength Training') {
                                            if (day5 < 7) {
                                              day5++;
                                              await SavedData.setFive(day5);
                                            }
                                          } else if (widget.title ==
                                              'Cardio Blast') {
                                            if (day6 < 7) {
                                              day6++;
                                              await SavedData.setSix(day6);
                                            }
                                          } else if (widget.title ==
                                              'Yoga and Meditation') {
                                            if (day7 < 7) {
                                              day7++;
                                              await SavedData.setSeven(day7);
                                            }
                                          }

                                          WorkoutHiveModel workoutHiveModel =
                                              WorkoutHiveModel(
                                                  id: DateTime.now()
                                                      .millisecondsSinceEpoch,
                                                  title: widget.title,
                                                  calories: widget.calories,
                                                  day: widget.day,
                                                  duration: widget.duration,
                                                  date: DateTime.now(),
                                                  index: widget.index);
                                          context
                                              .read<SetWorkoutHiveCubit>()
                                              .setWorkout(workoutHiveModel);

                                          // FARUH CODE

                                          await LocalDoneDaysDataSource
                                              .setDoneDay(
                                                  '${widget.title}${widget.day}');

                                          // Faruh Code
                                        }
                                      : () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const BottomNavigatorScreen(),
                                            ),
                                            (protected) => false,
                                          );
                                        },
                                  width: 250,
                                  color: AppColors.colorFFE177Yellow,
                                  text: 'Add to saved',
                                  textColor: AppColors.color0033EABlue,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.star2,
                      width: 100,
                    ),
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        AppImages.star3,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onPressed: () async {
                    // Faruh Code
                    await LocalDoneDaysDataSource.setDoneDay(
                        '${widget.title}${widget.day}');
                    // Faruh Code
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigatorScreen(),
                      ),
                      (protected) => false,
                    );
                  },
                  width: 250,
                  text: 'Return',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
