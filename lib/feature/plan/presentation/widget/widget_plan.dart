import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetPlan extends StatelessWidget {
  const WidgetPlan({
    super.key,
    required this.onTap,
    required this.model,
    required this.index,
  });
  final Function() onTap;
  final WorkoutsModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: model.image,
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
            padding: const EdgeInsets.all(16),
            height: 200,
            width: getWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  model.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model.title,
                      style: AppTextStyles.s24W700(color: Colors.white),
                    ),
                    const Spacer(),
                    FutureBuilder(
                      future: Premium.getSubscrp(),
                      builder: (context, AsyncSnapshot<bool?> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!) {
                            return const SizedBox();
                          } else if (!snapshot.data! && index > 2) {
                            return CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.grey,
                              child: Image.asset(
                                AppImages.lockIcon,
                                width: 30,
                              ),
                            );
                          } else if (!snapshot.data! && index < 3) {
                            return const SizedBox();
                          }
                        }
                        return CircleAvatar(
                          backgroundColor: AppColors.grey,
                          child: Image.asset(
                            AppImages.lockIcon,
                            width: 35,
                          ),
                        );
                      },
                    ),
                  ],
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
