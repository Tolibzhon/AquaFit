import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/feature/auth/premium_screen.dart';
import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/plan/presentation/day_screen.dart';
import 'package:aqua_fit/feature/plan/presentation/widget/widget_workuot.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:aqua_fit/helpers/saved_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({
    super.key,
    required this.model,
    required this.index,
  });
  final WorkoutsModel model;
  final int index;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  // int day = 0;
  // int day1 = 0;
  // int day2 = 0;
  // int day3 = 0;
  // int day4 = 0;
  // int day5 = 0;
  // int day6 = 0;
  // int day7 = 0;
  // List<String> listTitle = [];
  // List<String> listDay = [];
  // @override
  // void initState() {
  //   savedData();
  //   super.initState();
  // }

  // Future<void> savedData() async {
  //   int day1SavedData = await SavedData.getOne();
  //   int day2SavedData = await SavedData.getTwo();
  //   int day3SavedData = await SavedData.getThree();
  //   int day4SavedData = await SavedData.getFour();
  //   int day5SavedData = await SavedData.getFive();
  //   int day6SavedData = await SavedData.getSix();
  //   int day7SavedData = await SavedData.getSeven();
  //   List<String> listTitleSavedData = await SavedData.getChekTitle();
  //   List<String> listDaySavedData = await SavedData.getChekDay();
  //   setState(() {
  //     day1 = day1SavedData;
  //     day2 = day2SavedData;
  //     day3 = day3SavedData;
  //     day4 = day4SavedData;
  //     day5 = day5SavedData;
  //     day6 = day6SavedData;
  //     day7 = day7SavedData;
  //     listTitle = listTitleSavedData;
  //     listDay = listDaySavedData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // if (widget.model.title == 'Full Body Workout') {
    //   day = day1;
    // } else if (widget.model.title == 'Cardio Intensity') {
    //   day = day2;
    // } else if (widget.model.title == 'Strength Training') {
    //   day = day3;
    // } else if (widget.model.title == 'Yoga and Meditation') {
    //   day = day4;
    // } else if (widget.model.title == 'Strength Training') {
    //   day = day5;
    // } else if (widget.model.title == 'Cardio Blast') {
    //   day = day6;
    // } else if (widget.model.title == 'Yoga and Meditation') {
    //   day = day7;
    // }
    return Scaffold(
      appBar: CustomAppBar(title: widget.model.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.model.image,
              placeholder: (_, url) {
                return SizedBox(
                  height: 180,
                  width: getWidth(context),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.4),
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
              imageBuilder: (_, imageProvider) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: 180,
                  width: getWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.model.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.title,
                        style: AppTextStyles.s24W700(color: Colors.white),
                      ),
                      const Spacer(),
                      LinearPercentIndicator(
                        alignment: MainAxisAlignment.start,
                        barRadius: const Radius.circular(10),
                        lineHeight: 10.0,
                        percent: widget.model.progress,
                        backgroundColor: AppColors.lightGrey,
                        progressColor: AppColors.colorFFE177Yellow,
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              '${widget.model.daysLeft} days left',
                              style: AppTextStyles.s12W400(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              '${widget.model.percentage} %',
                              style: AppTextStyles.s12W400(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            /////////////////////////////////////
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.model.days.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return WidgetWorkout(
                    day: widget.model.days[index],
                    onTap: () async {
                      if (widget.model.days[index].dayState ==
                              DayState.available ||
                          widget.model.days[index].dayState ==
                              DayState.finished) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DayScreen(
                              index: widget.index,
                              image: widget.model.image,
                              day: widget.model.days[index],
                              title: widget.model.title,
                              calories: widget.model.calories,
                            ),
                          ),
                        );
                      } else if (widget.model.days[index].dayState ==
                          DayState.blocked) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(
                              isPop: true,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
