import 'package:aqua_fit/feature/statistics/widget/container_widget.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Water consumption',
                                  style: AppTextStyles.s16W400()),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Text('0', style: AppTextStyles.s20W400()),
                                  Text('/8 glasses',
                                      style: AppTextStyles.s14W400()),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            AppImages.waterIcon,
                            width: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        width: 95,
                        height: 37,
                        radius: 10,
                        color: AppColors.color0033EABlue,
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              context: context,
                              //isScrollControlled: true,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: Container(
                                      height: 400,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 25),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset(
                                                  AppImages.closeShow,
                                                  width: 25,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text('2/8 glasses per day',
                                                style: AppTextStyles.s24W500()),
                                            const SizedBox(height: 62),
                                            Image.asset(
                                              AppImages.positiveImage,
                                              width: 150,
                                            ),
                                            const SizedBox(height: 62),
                                            Text('Well done!',
                                                style: AppTextStyles.s32W700()),
                                                 const SizedBox(height: 25),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                              isDismissible: false,
                              enableDrag: false,
                            );
                          });
                        },
                        text: 'Drink',
                        style: AppTextStyles.s15W600(color: AppColors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Data',
                  style: AppTextStyles.s24W500(color: AppColors.black),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Calories burned (approx)',
                    style: AppTextStyles.s16W400(color: AppColors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: getWidth(context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    // crossAxisAlignment:
                    //     CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                '300',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '250',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '200',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '150',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '100',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '50',
                                style:
                                    AppTextStyles.s13W400(color: Colors.black),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
