import 'package:aqua_fit/feature/statistics/widget/container_widget.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Statistics',
                  style: AppTextStyles.s24W400(color: AppColors.black),
                ),
                Text(
                  'Track your progress and stay motivated',
                  style: AppTextStyles.s16W500(color: Colors.black54),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    ContainerWidget(count: 0, title: 'Workouts'),
                    const SizedBox(width: 20),
                    ContainerWidget(count: 0, title: 'Duration'),
                    const SizedBox(width: 20),
                    ContainerWidget(count: 0, title: 'Calories'),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  'Per day',
                  style: AppTextStyles.s24W500(color: AppColors.black),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 140,
                  width: getWidth(context),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
