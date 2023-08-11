import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:aqua_fit/main.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(String error) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF1100),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          error,
          textAlign: TextAlign.center,
          style: AppTextStyles.s15W400(color: Colors.white),
        ),
      ),
    ),
  );
}

void showSuccessSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF026405),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.s15W400(color: Colors.white),
        ),
      ),
    ),
  );
}

// Future<void> trendShowDialog(
//   BuildContext context,
//   String image,
// ) {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.transparent,
//         content: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: CachedNetworkImage(
//             imageUrl: image,
//             placeholder: (_, url) {
//               return Stack(
//                 children: [
//                   SizedBox(
//                     height: 430,
//                     width: 340,
//                     child: Shimmer.fromColors(
//                       baseColor: Colors.grey.withOpacity(0.4),
//                       highlightColor: Colors.white,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//             imageBuilder: (_, imageProvider) {
//               return Container(
//                 padding: const EdgeInsets.all(20),
//                 height: 430,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                     image: NetworkImage(image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//     },
//   );
// }
