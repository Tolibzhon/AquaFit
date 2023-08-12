import 'package:aqua_fit/config/premium.dart';
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
    required this.chek,
    required this.index,
  });
  final Function() onTap;
  final Day day;
  final bool chek;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getWidth(context),
        height: 50,
        decoration: BoxDecoration(
          color: chek == true
              ? AppColors.color3E68FFBg
              : AppColors.color3E68FFBg.withOpacity(0.7),
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
            FutureBuilder(
              future: Premium.getSubscrp(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!) {
                    return const SizedBox();
                  } else if (!snapshot.data! && index > 2) {
                    return CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.white,
                      child: Image.asset(
                        AppImages.lockIcon,
                        width: 30,
                      ),
                    );
                  } else if (!snapshot.data! && index < 3) {
                    return chek
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 14,
                            child: Image.asset(AppImages.checkIcon),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 14,
                            child: Image.asset(AppImages.checkIconEmpty),
                          );
                  }
                }
                return CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    AppImages.lockIcon,
                    width: 35,
                  ),
                );
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
