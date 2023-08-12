import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetWorkout extends StatelessWidget {
  const WidgetWorkout({
    super.key,
    required this.onTap,
    required this.day,
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
          color: getContainerColor(day.dayState),
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
              radius: 14,
              backgroundColor: AppColors.white,
              child: Image.asset(
                getCheckBoxImagePath(day.dayState),
                width: 35,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Color getContainerColor(DayState dayState) {
    switch (dayState) {
      case DayState.finished:
        return AppColors.color3E68FFBg;
      case DayState.available:
        return AppColors.color0033EABlue;
      default:
        return AppColors.color3E68FFBg.withOpacity(0.6);
    }
  }

  String getCheckBoxImagePath(DayState dayState) {
    switch (dayState) {
      case DayState.finished:
        return AppImages.checkIcon;
      case DayState.available:
        return AppImages.checkIconEmpty;
      case DayState.blocked:
        return AppImages.lockIcon;
      default:
        return AppImages.checkIconEmpty;
    }
  }
}
