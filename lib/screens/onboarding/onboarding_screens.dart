import 'package:flutter/material.dart';

import 'package:expenz/data/onboarding_screens_data.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/onboarding/front_screen.dart';
import 'package:expenz/constans/colors.dart';
import 'package:expenz/widgets/custom_button.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
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
                  children: [
                    FrontScreen(),
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

              // navigation button
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomButton(
                      buttonColor1: kMainColor1,
                      buttonColor2: kMainColor2,
                      buttonName: "buttonTitle",
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
