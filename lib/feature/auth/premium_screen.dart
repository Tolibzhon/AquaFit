import 'package:apphud/apphud.dart';
import 'package:aqua_fit/config/app_url.dart';
import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/config/web_view_screen.dart';
import 'package:aqua_fit/feature/widgets/buttom_navigator.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isPop = false});
  final bool isPop;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color3E68FFBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (widget.isPop) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigatorScreen()),
                          (protected) => false,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                ],
              ),
              Text(
                'PREMIUM',
                style: AppTextStyles.s32W800(color: Colors.white),
              ),
              const Spacer(),
              Image.asset(
                AppImages.premiumImage,
                width: 220,
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Image.asset(AppImages.checkPremium, width: 25),
                  const SizedBox(width: 10),
                  Text(
                    'No ADS',
                    style: AppTextStyles.s24W600(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Image.asset(AppImages.checkPremium, width: 25),
                  const SizedBox(width: 10),
                  Text(
                    'Access to all workouts',
                    style: AppTextStyles.s24W600(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                onPressed: () async {
                  var paywalls = await Apphud.paywalls();
                  await Apphud.purchase(
                    product: paywalls?.paywalls.first.products!.first,
                  ).whenComplete(
                    () async {
                      if (await Apphud.hasActiveSubscription() ||
                          await Apphud.hasPremiumAccess()) {
                        await Premium.setSubscrp();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
                text: 'Buy Premium for \$1,99',
                color: AppColors.colorFFE177Yellow,
                style: AppTextStyles.s20W600(color: AppColors.color0033EABlue),
              ),
              const SizedBox(height: 30),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
