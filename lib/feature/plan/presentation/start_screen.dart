import 'dart:async';

import 'package:aqua_fit/feature/plan/data/workouts_model.dart';
import 'package:aqua_fit/feature/plan/presentation/finished_screen.dart';
import 'package:aqua_fit/feature/widgets/custom_button.dart';
import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_images.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key,
    required this.exercises,
    required this.image,
    required this.title,
    required this.calories,
    required this.day, required this.index,
  });
  final List<Exercise> exercises;
  final String image;
  final String title;
  final int calories;
  final int day;
  final int index;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  Timer timerStart = Timer(Duration.zero, () {});
  late final oneSecStart = const Duration(seconds: 1);
  bool isChekStart = false;

  bool _isRunning = false;

  @override
  void initState() {
    startTimerStart();

    super.initState();
  }

  int secondsStart = 0;
  Future<void> startTimerStart() async {
    secondsStart = 3;
    timerStart = Timer.periodic(
      oneSecStart,
      (Timer timer) {
        if (mounted) {
          setState(() {
            secondsStart--;
            if (secondsStart == 0) {
              timer.cancel();
              setState(() {
                isChekStart = true;
              });
              if (!_isRunning) {
                if (mounted) {
                  startTimerMain();
                  setState(() {
                    _isRunning = !_isRunning;
                  });
                }
              }
            }
          });
        }
      },
    );
  }

  String minutesConvert(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return clockTimer.inSeconds.remainder(60).toString().padLeft(
          2,
        );
  }

  Timer timerMain = Timer(Duration.zero, () {});
  late final oneSecMain = const Duration(seconds: 1);
  int secondMain = 1;

  Future<void> startTimerMain() async {
    if (!_isRunning) {
      secondMain = 0;
    }

    if (timerMain.isActive) {
      timerMain.cancel();
    }

    timerMain = Timer.periodic(
      oneSecMain,
      (Timer timer) {
        if (mounted) {
          setState(() {
            if (_isRunning) {
              secondMain++;
            }

            // if (secondMain == 0) {
            //   timer.cancel();

            // }
          });
        }
      },
    );
  }

  String minutesConvertMain(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isChekStart == false
          ? Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.color3E68FFBg.withOpacity(0.7),
                    BlendMode.srcOver,
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Center(
                  child: Text(
                    minutesConvert(secondsStart),
                    style: AppTextStyles.s128W700(
                      color: AppColors.colorFFE177Yellow,
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  widget.image,
                ),
                Positioned(
                  top: 160,
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.startEllipse),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        minutesConvertMain(secondMain),
                        style: AppTextStyles.s36W800(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 25,
                  child: InkWell(
                    onTap: () {
                      timerMain.cancel();
                      Navigator.pop(context);
                    },
                    child: Image.asset(AppImages.closeIcon, width: 35),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 190,
                    decoration: BoxDecoration(
                        color: AppColors.color3E68FFBg,
                        borderRadius: BorderRadius.circular(10)),
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          currantPage = value;
                        });
                      },
                      controller: controller,
                      children: List.generate(widget.exercises.length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exercise ${index += 1} of ${widget.exercises.length}',
                              style:
                                  AppTextStyles.s20W700(color: AppColors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.exercises[currantPage].description,
                              style:
                                  AppTextStyles.s16W400(color: AppColors.white),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 25,
                  right: 25,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isRunning = !_isRunning;
                            if (_isRunning) {
                              startTimerMain();
                            } else {
                              timerMain.cancel();
                            }
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: AppColors.color0033EABlue,
                              shape: BoxShape.circle),
                          child: Icon(
                              _isRunning == true
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: AppColors.white,
                              size: 35),
                        ),
                      ),
                      const SizedBox(width: 40),
                      currantPage == 4
                          ? CustomButton(
                              width: 230,
                              height: 50,
                              onPressed: () {
                                timerMain.cancel();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FinishedScreen(
                                      title: widget.title,
                                      calories: widget.calories,
                                      day: widget.day,
                                      duration: secondMain, index: widget.index,
                                    ),
                                  ),
                                  (protected) => false,
                                );
                              },
                              text: 'Finish',
                              style:
                                  AppTextStyles.s20W600(color: AppColors.white),
                            )
                          : CustomButton(
                              width: 230,
                              height: 50,
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              text: 'Next',
                              style:
                                  AppTextStyles.s20W600(color: AppColors.white),
                            )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
