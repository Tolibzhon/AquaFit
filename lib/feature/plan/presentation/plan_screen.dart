import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/feature/auth/premium_screen.dart';
import 'package:aqua_fit/feature/plan/data/cubit/get_workouts_cubit.dart';
import 'package:aqua_fit/feature/plan/data/domain/get_workouts_repo.dart';
import 'package:aqua_fit/feature/plan/presentation/widget/widget_plan.dart';
import 'package:aqua_fit/feature/plan/presentation/workout_screen.dart';
import 'package:aqua_fit/feature/widgets/app_error_text.dart';
import 'package:aqua_fit/feature/widgets/app_indicator.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Workouts plan'),
      body: BlocProvider(
        create: (context) =>
            GetWorkoutsCubit(GetWorkoutsRepoImpl())..getWorkouts(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text(
                'Choose the right training plan for you',
                style:
                    AppTextStyles.s16W500(color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(height: 10),
              BlocBuilder<GetWorkoutsCubit, GetWorkoutsState>(
                builder: (context, state) {
                  return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) {
                        return Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: model.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) => WidgetPlan(
                              model: model[index],
                              onTap: () async {
                                final isBuy = await Premium.getSubscrp();
                                if (!isBuy && index > 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PremiumScreen(
                                        isPop: true,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WorkoutScreen(model: model[index]),
                                    ),
                                  );
                                }
                              },
                              index: index,
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
