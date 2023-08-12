import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetDay extends StatelessWidget {
  const WidgetDay({
    super.key, required this.exercises,
    // required this.onTap,
  });
  // final Function() onTap;
  final Exercise exercises;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: getWidth(context),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.color3E68FFBg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text(
            exercises.title,
            style: AppTextStyles.s20W600(color: Colors.white),
          ),
          const Spacer(),
          Image.asset(AppImages.trainIcon, width: 40),
        ],
      ),
    );
  }
}
