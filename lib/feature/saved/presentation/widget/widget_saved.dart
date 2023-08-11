import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetSaved extends StatelessWidget {
  const WidgetSaved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                'Legs and hamstrings',
                style: AppTextStyles.s16W500(color: Colors.white),
              ),
              Text(
                'Day 5',
                style: AppTextStyles.s12W400(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}