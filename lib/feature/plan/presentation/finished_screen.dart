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
  const FinishedScreen(
      {super.key,
      required this.title,
      required this.calories,
      required this.day,
      required this.duration});
  final String title;
  final int calories;
  final int day;
  final int duration;

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  int workouts = 0;

  late int minutes = widget.duration ~/ 60;
  late int seconds = widget.duration % 60;

  List<String> list = [];
  @override
  void initState() {
    savedData();
    super.initState();
  }

  Future<void> savedData() async {
    var workoutsSavedData = await SavedData.getWorkouts();
    List<String> listSavedData = await SavedData.getIsChek();
    setState(() {
      workouts = workoutsSavedData;
      list = listSavedData;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigatorScreen(),
                              ),
                              (protected) => false,
                            );
                          },
                          child: Image.asset(AppImages.closeIcon, width: 35)),
                    ],
                  ),
                ),
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
                                bool containsSimilarTitle =
                                    list.any((e) => e == widget.title);
                                return CustomButton(
                                  onPressed: containsSimilarTitle == false
                                      ? () async {
                                          list.add(widget.title);

                                          workouts++;
                                          await SavedData.setIsChek(list);
                                          await SavedData.setWorkouts(workouts);

                                          WorkoutHiveModel workoutHiveModel =
                                              WorkoutHiveModel(
                                                  id: DateTime.now()
                                                      .millisecondsSinceEpoch,
                                                  title: widget.title,
                                                  calories: widget.calories,
                                                  day: widget.day,
                                                  duration: widget.duration,
                                                  date: DateTime.now());
                                          context
                                              .read<SetWorkoutHiveCubit>()
                                              .setWorkout(workoutHiveModel);
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
                  onPressed: () {
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
