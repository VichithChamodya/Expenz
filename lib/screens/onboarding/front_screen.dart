import 'package:flutter/material.dart';

import 'package:expenz/constans/colors.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 250,
          fit: BoxFit.cover,
        ),
        Text(
          "Expenz",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700,
            color: kMainColor2,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
