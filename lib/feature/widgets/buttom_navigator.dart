import 'package:aqua_fit/feature/plan/presentation/plan_screen.dart';
import 'package:aqua_fit/feature/saved/presentation/saved_screen.dart';
import 'package:aqua_fit/feature/settings/presentation/settings_screen.dart';
import 'package:aqua_fit/feature/statistics/presentation/statistics_screen.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:flutter/material.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  late int index = widget.index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.color3E68FFBg,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.color3E68FFBg,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          selectedItemColor: AppColors.grey,
          unselectedItemColor: AppColors.white,
          currentIndex: index,
          onTap: (indexFrom) async {
            setState(() {
              index = indexFrom;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarPlanActive,
                height: 35,
              ),
              icon: Image.asset(
                AppImages.navbarPlan,
                height: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarStatisticsActive,
                height: 35,
              ),
              icon: Image.asset(
                AppImages.navbarStatistics,
                height: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarSavedActive,
                height: 35,
              ),
              icon: Image.asset(
                AppImages.navbarSaved,
                height: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarSettingsActive,
                height: 35,
              ),
              icon: Image.asset(
                AppImages.navbarSettings,
                height: 35,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const PlanScreen(),
  const StatisticsScreen(),
  const SavedScreen(),
  const SettingsScreen(),
];
