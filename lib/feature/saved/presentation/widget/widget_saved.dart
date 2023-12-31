import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetSaved extends StatelessWidget {
  const WidgetSaved({
    super.key,
    required this.model,
    required this.onTap, required this.onTapIcon,
  });
  final WorkoutHiveModel model;
  final VoidCallback onTap;
  final VoidCallback onTapIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: getWidth(context),
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.color3E68FFBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: AppTextStyles.s16W500(color: Colors.white),
                ),
                Text(
                  'Day ${model.day}',
                  style: AppTextStyles.s12W400(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: onTapIcon,
                  child: const Icon(Icons.delete_forever_outlined,
                      size: 30, color: Colors.red),
                ),
                const Icon(Icons.chevron_right, color: Colors.white, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
