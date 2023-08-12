import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetPlan extends StatelessWidget {
  const WidgetPlan({
    super.key,
    required this.onTap, required this.model,
  });
  final Function() onTap;
final WorkoutsModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl:
            model.image,
        placeholder: (_, url) {
          return SizedBox(
            height: 200,
            width: getWidth(context),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
        imageBuilder: (_, imageProvider) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            width: getWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image:  DecorationImage(
                image: NetworkImage(
                  model.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: AppTextStyles.s24W700(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  '${model.days.length} days',
                  style: AppTextStyles.s16W500(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
