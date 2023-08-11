import 'package:aqua_fit/feature/widgets/spaces.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(
        imageUrl:
            'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
        placeholder: (_, url) {
          return SizedBox(
            height: getHeight(context),
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
            height: getHeight(context),
            width: getWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: const NetworkImage(
                  'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                ),
                colorFilter: ColorFilter.mode(
                  AppColors.color3E68FFBg.withOpacity(0.7),
                  BlendMode.srcOver,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                '3',
                style: AppTextStyles.s128W700(
                  color: AppColors.colorFFE177Yellow,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
