import 'package:expenz/constans/constans.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:expenz/constans/colors.dart';

class GetUserDataScreen extends StatefulWidget {
  const GetUserDataScreen({super.key});

  @override
  State<GetUserDataScreen> createState() => _GetUserDataScreenState();
}

class _GetUserDataScreenState extends State<GetUserDataScreen> {
  // manage password visibility state
  bool _isPasswordVisible = false;

  // manage confirm password visibility state
  bool _isConfirmPasswordVisible = false;

  // for the checkbox
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your\nPresonal Data",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kBlack,
                  ),
                ),
                SizedBox(height: 30),

                // add form
                Form(
                  child: Column(
                    children: [
                      // field for the username
                      TextFormField(
                        cursorColor: kMainColor2,
                        cursorWidth: 1.5,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kMainColor2),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        ),
                      ),

                      SizedBox(height: 20),

                      // field for the email
                      TextFormField(
                        cursorColor: kMainColor2,
                        cursorWidth: 1.5,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kMainColor2),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        ),
                      ),

                      SizedBox(height: 20),

                      // field for the password
                      TextFormField(
                        cursorColor: kMainColor2,
                        cursorWidth: 1.5,
                        obscureText:
                            !_isPasswordVisible, // Toggle password visibility
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kMainColor2),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; // toggle password visibility
                              });
                            },
                            icon: _isPasswordVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: kBlack,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: kGrey,
                                  ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // field for the confirm password
                      TextFormField(
                        cursorWidth: 1.5,
                        obscureText:
                            !_isConfirmPasswordVisible, // toggle confirm password visibility
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kMainColor2),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible; // Toggle visibility
                              });
                            },
                            icon: _isConfirmPasswordVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: kBlack,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: kGrey,
                                  ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),

                      // remember me for the next time
                      Row(
                        mainAxisSize:
                            MainAxisSize.min, // minimize the size of the row
                        children: [
                          Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Checkbox(
                            value: _isRememberMe,
                            activeColor: kMainColor2,
                            side: BorderSide(
                              color: kGrey,
                              width: 1.5,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _isRememberMe =
                                    value ?? false; // toggle the state
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // submit button
                      const CustomButton(
                        buttonName: "Next",
                        buttonColor1: kMainColor1,
                        buttonColor2: kMainColor2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
