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

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key, required this.model});
  final WorkoutsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: model.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: model.image,
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
                        model.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: AppTextStyles.s24W700(color: Colors.white),
                      ),
                      const Spacer(),
                      FutureBuilder(
                          future: SavedData.getDay(),
                          builder: (context, data) {
                            return LinearPercentIndicator(
                              alignment: MainAxisAlignment.start,
                              barRadius: const Radius.circular(10),
                              lineHeight: 10.0,
                              percent: data == 1
                                  ? 0.14
                                  : data == 2
                                      ? 0.28
                                      : data == 3
                                          ? 0.42
                                          : data == 4
                                              ? 0.56
                                              : data == 5
                                                  ? 0.70
                                                  : data == 6
                                                      ? 0.85
                                                      : data == 7
                                                          ? 1
                                                          : 0,
                              backgroundColor: AppColors.lightGrey,
                              progressColor: AppColors.colorFFE177Yellow,
                            );
                          }),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              '${model.days.length} days left',
                              style: AppTextStyles.s12W400(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              '0 %',
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
                itemCount: model.days.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => WidgetWorkout(
                  day: model.days[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayScreen(
                          image: model.image,
                          day: model.days[index],
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
