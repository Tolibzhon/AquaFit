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
  const WorkoutScreen({super.key, required this.model});
  final WorkoutsModel model;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int day = 0;
  @override
  void initState() {
    savedData();
    super.initState();
  }

  Future<void> savedData() async {
    var dayConsSavedData = await SavedData.getDay();
    setState(() {
      day = dayConsSavedData;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        percent: day == 1
                            ? 0.14
                            : day == 2
                                ? 0.28
                                : day == 3
                                    ? 0.42
                                    : day == 4
                                        ? 0.56
                                        : day == 5
                                            ? 0.70
                                            : day == 6
                                                ? 0.85
                                                : day == 7
                                                    ? 1
                                                    : 0,
                        backgroundColor: AppColors.lightGrey,
                        progressColor: AppColors.colorFFE177Yellow,
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              '$day days left',
                              style: AppTextStyles.s12W400(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              '${(day * 100) / day} %',
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
                itemBuilder: (context, index) => WidgetWorkout(
                  day: widget.model.days[index],
                  onTap: () async {
                    if (day < 7) {
                      day++;
                      await SavedData.setDay(day);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayScreen(
                          image: widget.model.image,
                          day: widget.model.days[index],
                          title: widget.model.title,
                          calories: widget.model.calories,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
