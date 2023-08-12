
import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/statistics/widget/widget_graph.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:aqua_fit/helpers/date_formates.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class WidgetStatisticContainer extends StatefulWidget {
  const WidgetStatisticContainer({
    super.key,
    required this.model,
  });

  final List<WorkoutHiveModel> model;


  @override
  State<WidgetStatisticContainer> createState() =>
      _WidgetStatisticContainerState();
}

class _WidgetStatisticContainerState extends State<WidgetStatisticContainer> {
  final caloriesResults = <int>[];

  setBpmResultList() {
    for (var calories in widget.model) {
      caloriesResults.add(calories.calories);
    }
  }

  @override
  void initState() {
    setBpmResultList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        '${((caloriesResults.max / 7) * 7).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 6).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 5).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 4).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 3).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 2).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${((caloriesResults.max / 7) * 1).toInt()}',
                        style: AppTextStyles.s13W400(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.model.length,
                        itemBuilder: (context, index) {
                          return WidgetGraph(
                            height:
                                (widget.model[index].calories.toDouble() *
                                        100) /
                                    (((caloriesResults.max / 7) * 7).toInt()),
                            week: dateFormatMain
                                .format(widget.model[index].date),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
