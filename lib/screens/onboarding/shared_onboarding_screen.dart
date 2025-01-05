import 'package:flutter/material.dart';

import 'package:expenz/constans/colors.dart';
import 'package:expenz/constans/constans.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const SharedOnboardingScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMaxPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 300,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: kBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
