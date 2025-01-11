import 'package:expenz/constans/colors.dart';
import 'package:flutter/material.dart';

import 'package:expenz/screens/onboarding/onboarding_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
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
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: kMainColor2, // cursor color
          selectionColor: kSelectionColor, // selection color
          selectionHandleColor: kMainColor2, // handle color (dots/pointers)
        ),
      ),
      home: const Scaffold(
        body: OnboardingScreens(),
      ),
    );
  }
}
