import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetDay extends StatelessWidget {
  const WidgetDay({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              'Back squat  x 15',
              style: AppTextStyles.s20W600(color: Colors.white),
            ),
            const Spacer(),
            Image.asset(AppImages.trainIcon, width: 40),
          ],
        ),
      ),
    );
  }
}
