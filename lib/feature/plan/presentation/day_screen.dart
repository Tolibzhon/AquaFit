import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/plan/presentation/start_screen.dart';
import 'package:aqua_fit/feature/plan/presentation/widget/widget_day.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  const DayScreen(
      {super.key,
      required this.day,
      required this.image,
      required this.title,
      required this.calories, required this.index});
  final Day day;
  final String image;
  final String title;
  final int calories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Day ${day.day}'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: day.exercises.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => WidgetDay(
                  exercises: day.exercises[index],
                ),
              ),
            ),
            CustomButton(
                width: 150,
                color: AppColors.colorFFE177Yellow,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartScreen(
                        image: image,
                        exercises: day.exercises,
                        title: title,
                        day: day.day,
                        calories: calories,
                        index: index,
                      ),
                    ),
                  );
                },
                text: 'Start'),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
