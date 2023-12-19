import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_estate_app_new/Screens/Authentication/Login/login_option.dart';
import 'package:real_estate_app_new/Screens/Onboarding/onboarding_1.dart';
import 'package:real_estate_app_new/Screens/Onboarding/onboarding_2.dart';
import 'package:real_estate_app_new/Screens/Onboarding/onboarding_3.dart';
import 'package:real_estate_app_new/Utils/app_bar.dart';
import 'package:real_estate_app_new/Utils/navigation.dart';
import 'package:real_estate_app_new/custom_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          appBar(
            context,
            const LoginOption(),
            Image.asset(
              'images/logo.png',
              height: 100,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  // onPageChanged: (index) {
                  //   if (index + 1 == 3) {

                  //   } else if (index == 0) {}
                  // },
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: const [
                    OnBoarding1(),
                    OnBoarding2(),
                    OnBoarding3(),
                    OnBoarding3(),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  right: 30,
                  left: 30,
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: const SlideEffect(
                          dotWidth: 50,
                          dotHeight: 5,
                          activeDotColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     controller.previousPage(
                          //       duration: const Duration(milliseconds: 500),
                          //       curve: Curves.linear,
                          //     );
                          //   },
                          //   child: const CircleAvatar(
                          //     backgroundColor: Colors.white,
                          //     radius: 25,
                          //     child: Icon(
                          //       Icons.arrow_back,
                          //       color: Color(0xff252B5C),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(width: 20),
                          CustomButton(
                            text: 'Next',
                            onTap: () {
                              if (controller.page == 3) {
                                nextPage(context, const LoginOption());
                              } else {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
