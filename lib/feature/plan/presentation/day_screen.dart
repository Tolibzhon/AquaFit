import 'package:aqua_fit/feature/plan/presentation/start_screen.dart';
import 'package:aqua_fit/feature/plan/presentation/widget/widget_day.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Workout Screen'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 8,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) => WidgetDay(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
