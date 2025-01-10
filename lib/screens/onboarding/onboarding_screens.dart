import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:expenz/data/onboarding_screens_data.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/onboarding/front_screen.dart';
import 'package:expenz/constans/colors.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:expenz/screens/get_user_data_screen.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  // create page controller
  final PageController _controller = PageController();

  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              // onboarding screens
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 4;
                    });
                  },
                  children: [
                    const FrontScreen(),
                    SharedOnboardingScreen(
                      image: OnboardingScreensData
                          .onboardingScreensDataList[0].image,
                      title: OnboardingScreensData
                          .onboardingScreensDataList[0].title,
                      subTitle: OnboardingScreensData
                          .onboardingScreensDataList[0].subTitle,
                    ),
                    SharedOnboardingScreen(
                      image: OnboardingScreensData
                          .onboardingScreensDataList[1].image,
                      title: OnboardingScreensData
                          .onboardingScreensDataList[1].title,
                      subTitle: OnboardingScreensData
                          .onboardingScreensDataList[1].subTitle,
                    ),
                    SharedOnboardingScreen(
                      image: OnboardingScreensData
                          .onboardingScreensDataList[2].image,
                      title: OnboardingScreensData
                          .onboardingScreensDataList[2].title,
                      subTitle: OnboardingScreensData
                          .onboardingScreensDataList[2].subTitle,
                    ),
                    SharedOnboardingScreen(
                      image: OnboardingScreensData
                          .onboardingScreensDataList[3].image,
                      title: OnboardingScreensData
                          .onboardingScreensDataList[3].title,
                      subTitle: OnboardingScreensData
                          .onboardingScreensDataList[3].subTitle,
                    ),
                  ],
                ),
              ),

              // page dot indicators
              Container(
                alignment: const Alignment(0, 0.55),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: const SwapEffect(
                    type: SwapType.yRotation,
                    activeDotColor: kMainColor2,
                    dotColor: kShadowColor,
                  ),
                ),
              ),

              // navigation button
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: !showDetailsPage
                      ? GestureDetector(
                          onTap: () {
                            _controller.animateToPage(
                              _controller.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOutQuint,
                            );
                          },
                          child: const CustomButton(
                            buttonColor1: kMainColor1,
                            buttonColor2: kMainColor2,
                            buttonName: "Next",
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            // navigate to the get user data screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GetUserDataScreen(),
                              ),
                            );
                          },
                          child: const CustomButton(
                            buttonColor1: kMainColor1,
                            buttonColor2: kGreen,
                            buttonName: "Get Started !",
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
