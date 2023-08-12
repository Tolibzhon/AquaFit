import 'package:aqua_fit/feature/saved/logic/cubits/get_workout_hive_cubit/get_workout_hive_cubit.dart';
import 'package:aqua_fit/feature/saved/presentation/widget/widget_saved.dart';
import 'package:aqua_fit/feature/widgets/app_error_text.dart';
import 'package:aqua_fit/feature/widgets/app_indicator.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    context.read<GetWorkoutHiveCubit>().getWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved workouts'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              'Create your own plan from favorite trainings',
              style:
                  AppTextStyles.s16W500(color: Colors.black.withOpacity(0.6)),
            ),
            const SizedBox(height: 20),
            BlocBuilder<GetWorkoutHiveCubit, GetWorkoutHiveState>(
              builder: (context, state) {
                return state.when(
                    loading: () => const AppIndicator(),
                    error: (error) => AppErrorText(error: error),
                    success: (model) {
                      return model.isNotEmpty
                          ? Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: model.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemBuilder: (context, index) =>
                                    WidgetSaved(model: model[index]),
                              ),
                            )
                          : Expanded(
                              child: Center(
                                child: Text(
                                  'No saved workouts yet',
                                  style: AppTextStyles.s24W500(
                                      color: Colors.black54),
                                ),
                              ),
                            );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
