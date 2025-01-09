import 'package:expenz/constans/colors.dart';
import 'package:flutter/material.dart';

import 'package:expenz/screens/onboarding/onboarding_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenz",
      theme: ThemeData(
        fontFamily: "Inter",
        primaryColor: kMainColor1,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kMainColor2, // cursor color
          selectionColor: kSelectionColor, // selection color
          selectionHandleColor: kMainColor2, // handle color (dots/pointers)
        ),
      ),
      home: Scaffold(
        body: OnboardingScreens(),
      ),
    );
  }
}
