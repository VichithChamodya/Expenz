import 'package:flutter/material.dart';

import 'package:expenz/constans/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor1;
  final Color buttonColor2;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor1,
    required this.buttonColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [buttonColor1, buttonColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
