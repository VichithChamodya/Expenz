import 'package:expenz/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:expenz/services/user_services.dart';
import 'package:expenz/constans/constans.dart';
import 'package:expenz/constans/colors.dart';
import 'package:expenz/widgets/custom_button.dart';

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

  // form key to the form validations
  final _formKey = GlobalKey<FormState>();

  // controllers for the textFormFields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                const Text(
                  "Enter Your\nPresonal Data",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kBlack,
                  ),
                ),
                const SizedBox(height: 30),

                // add form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // field for the username
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          // check weather the user entered a valid username
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                          // If everything is valid, return null
                          return null;
                        },
                        cursorWidth: 1.5,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kRed),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // field for the email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          // check weather the user entered a valid email
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          // If everything is valid, return null
                          return null;
                        },
                        cursorWidth: 1.5,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kRed),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // field for the password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          // check weather the user entered a valid password
                          if (value!.isEmpty) {
                            return "Please Enter Valid Password";
                          }
                          // If everything is valid, return null
                          return null;
                        },
                        cursorWidth: 1.5,
                        obscureText:
                            !_isPasswordVisible, // Toggle password visibility
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kRed),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; // toggle password visibility
                              });
                            },
                            icon: _isPasswordVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: kBlack,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: kGrey,
                                  ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // field for the confirm password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          // check weather the user confirmed the password
                          if (value!.isEmpty) {
                            return "Please Confirm Your Password";
                          }
                          // Check if the passwords do not match
                          if (value != _passwordController.text) {
                            return "Make sure both passwords are the same";
                          }
                          // If everything is valid, return null
                          return null;
                        },
                        cursorWidth: 1.5,
                        obscureText:
                            !_isConfirmPasswordVisible, // toggle confirm password visibility
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kShadowColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kRed),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kMainColor2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible; // Toggle visibility
                              });
                            },
                            icon: _isConfirmPasswordVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: kBlack,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: kGrey,
                                  ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // remember me for the next time
                      Row(
                        mainAxisSize:
                            MainAxisSize.min, // minimize the size of the row
                        children: [
                          const Text(
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
                            side: const BorderSide(
                              color: kGrey,
                              width: 1.5,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _isRememberMe = value!; // toggle the state
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // submit button
                      GestureDetector(
                        child: const CustomButton(
                          buttonName: "Next",
                          buttonColor1: kMainColor1,
                          buttonColor2: kMainColor2,
                        ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // if form is valid, process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            // save the username and email in the device storage
                            await UserServices.storeUserDetails(
                              userName: userName,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                              context: context,
                            );

                            // navigate to the main screen
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            }
                          }
                        },
                      ),
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
