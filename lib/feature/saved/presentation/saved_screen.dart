import 'package:aqua_fit/feature/saved/presentation/widget/widget_saved.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved workouts'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => const WidgetSaved(),
        ),
      ),
    );
  }
}
