import 'package:apphud/apphud.dart';
import 'package:aqua_fit/config/app_url.dart';
import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/config/web_view_screen.dart';
import 'package:aqua_fit/feature/auth/premium_screen.dart';
import 'package:aqua_fit/feature/widgets/buttom_navigator.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color3E68FFBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    currantPage = value;
                  });
                },
                controller: controller,
                children: [
                  Column(
                    children: [
                      const Spacer(),
                      Text(
                        'ACTIVE LIFESTYLE',
                        style: AppTextStyles.s32W800(color: Colors.white),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Training programs with unique exercises in the pool or on the beach',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s24W500(color: Colors.white),
                      ),
                      const Spacer(),
                      Image.asset(
                        AppImages.onBording1,
                        width: 280,
                      ),
                      const Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Text(
                        'STAY MOTIVATED',
                        style: AppTextStyles.s32W800(color: Colors.white),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Make physical activity fun and inspiring, track your progress',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s24W500(color: Colors.white),
                      ),
                      const Spacer(),
                      Image.asset(
                        AppImages.onBording2,
                        width: 280,
                      ),
                      const Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Text(
                        'PERSONAL PLAN',
                        style: AppTextStyles.s32W800(color: Colors.white),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Add workouts to saved ones and create your own plan from your favorite trainings',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s24W500(color: Colors.white),
                      ),
                      const Spacer(),
                      Image.asset(
                        AppImages.onBording3,
                        width: 280,
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              color: AppColors.colorFFE177Yellow,
              onPressed: () async {
                if (currantPage == 2) {
                  final isBuy = await Premium.getSubscrp();
                  if (!isBuy) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PremiumScreen(),
                      ),
                      (protected) => false,
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen()),
                      (protected) => false,
                    );
                  }
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              text: 'Continue',
              style: AppTextStyles.s20W600(color: AppColors.color0033EABlue),
            ),
            const SizedBox(height: 12),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppUrl.termOfUse,
                            title: "Term of Use",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Terms of Service',
                      style: AppTextStyles.s15W400(color: AppColors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final hasPremiumAccess = await Apphud.hasPremiumAccess();
                      final hasActiveSubscription =
                          await Apphud.hasActiveSubscription();
                      if (hasPremiumAccess || hasActiveSubscription) {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("ISBUY", true);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: const Text('Success!'),
                            content:
                                const Text('Your purchase has been restored!'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: const Text('Restore purchase'),
                            content: const Text(
                                'Your purchase is not found.\nSupport: ${AppUrl.supportForm}'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () => {Navigator.of(context).pop()},
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Restore',
                      style: AppTextStyles.s15W400(color: AppColors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppUrl.privacyPolicy,
                            title: "Privacy Policy",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Privacy Policy',
                      style: AppTextStyles.s15W400(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
