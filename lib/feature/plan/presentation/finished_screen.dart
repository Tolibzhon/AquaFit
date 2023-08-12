import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const Spacer(),
                  Image.asset(AppImages.closeIcon, width: 35),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                  width: getWidth(context),
                  height: 593,
                  child: Container(
                    height: getHeight(context),
                    width: getWidth(context),
                    decoration: BoxDecoration(
                      color: AppColors.color0033EABlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Image.asset(AppImages.star1, width: 100),
                        Image.asset(AppImages.congrats, width: 200),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '08:30',
                              style: AppTextStyles.s28W600(color: Colors.white),
                            ),
                            Text(
                              '1570',
                              style: AppTextStyles.s28W600(color: Colors.white),
                            ),
                            Text(
                              '5th',
                              style: AppTextStyles.s28W600(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Duration',
                              style: AppTextStyles.s15W700(color: Colors.white),
                            ),
                            Text(
                              'Kcal',
                              style: AppTextStyles.s15W700(color: Colors.white),
                            ),
                            Text(
                              'Day',
                              style: AppTextStyles.s15W700(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomButton(
                          width: 250,
                          color: AppColors.colorFFE177Yellow,
                          text: 'Add to saved',
                          textColor: AppColors.color0033EABlue,
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.star2,
                  width: 100,
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    AppImages.star3,
                    width: 100,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const CustomButton(
              width: 250,
              text: 'Return',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
