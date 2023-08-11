import 'package:apphud/apphud.dart';
import 'package:aqua_fit/config/app_url.dart';
import 'package:aqua_fit/config/premium.dart';
import 'package:aqua_fit/config/web_view_screen.dart';
import 'package:aqua_fit/feature/auth/premium_screen.dart';
import 'package:aqua_fit/feature/widgets/custom_app_bar.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
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
              child: Row(
                children: [
                  Image.asset(AppImages.privacyIcon, width: 15),
                  const SizedBox(width: 10),
                  Text(
                    'Privacy Policy',
                    style: AppTextStyles.s15W400(),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 30),
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
              child: Row(
                children: [
                  Image.asset(AppImages.termsIcon, width: 15),
                  const SizedBox(width: 10),
                  Text(
                    'Terms of Use',
                    style: AppTextStyles.s15W400(),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewScreen(
                      url: AppUrl.supportForm,
                      title: "Support",
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(AppImages.supportIcon, width: 15),
                  const SizedBox(width: 10),
                  Text(
                    'Support',
                    style: AppTextStyles.s15W400(),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 30),
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
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Success!'),
                      content: const Text('Your purchase has been restored!'),
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
                    builder: (BuildContext context) => CupertinoAlertDialog(
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
              child: Row(
                children: [
                  Image.asset(AppImages.restoreIcon, width: 15),
                  const SizedBox(width: 10),
                  Text(
                    'Restore',
                    style: AppTextStyles.s15W400(),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 30),
            FutureBuilder(
              future: Premium.getSubscrp(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data!) {
                    return CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(
                              isPop: true,
                            ),
                          ),
                        );
                      },
                      text: 'Buy Premium for \$1,99',
                      color: AppColors.colorFFE177Yellow,
                      style: AppTextStyles.s20W600(
                          color: AppColors.color0033EABlue),
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
