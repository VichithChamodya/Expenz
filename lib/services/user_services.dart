import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to store the user name and email in shared preferences
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
/*

      /// check whether the user entered password and confirm password are same
      if (password != confirmPassword) {
        /// show an alert message if the passwords are not same
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords do not match"),
            ///duration: Duration(seconds: 2),
          ),

        );
        return;
      }

*/

      // if the passwords are same, store the user name and email in shared preferences

      // create an instance of shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // sotre the user name and email as key value pairs
      await prefs.setString("userName", userName);
      await prefs.setString("email", email);

      // show an alert message if the user name and email are stored successfully
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your data stored successfully"),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (error) {
      error.toString();
    }
  }
}
