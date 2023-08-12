import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetWorkout extends StatelessWidget {
  const WidgetWorkout({
    super.key,
    required this.onTap, required this.day,
  });
  final Function() onTap;
  final Day day;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getWidth(context),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.color3E68FFBg,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              'Day ${day.day}',
              style: AppTextStyles.s15W600(color: Colors.white),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14,
              child: Image.asset(AppImages.checkIcon),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
