import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetGraph extends StatelessWidget {
  const WidgetGraph({super.key, required this.week, required this.height});
  final String week;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 16,
            height:height / 100>=1.0?230: 230 * (height / 100),
            decoration: BoxDecoration(
                color: AppColors.color0033EABlue,
                borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(height: 4),
          Text(
            week,
            style: AppTextStyles.s13W400(color: Colors.black),
          )
        ],
      ),
    );
  }

}
