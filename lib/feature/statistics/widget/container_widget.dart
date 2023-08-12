import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.count,
    required this.title,
  });
  final String count;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.color0033EABlue,
            width: 2,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            count,
            style: AppTextStyles.s32W500(color: AppColors.color0033EABlue),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: AppTextStyles.s12W500(color: AppColors.black),
          ),
        ]),
      ),
    );
  
  }
}
