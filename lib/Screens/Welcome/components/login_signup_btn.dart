import 'package:auto_select_candidate/Screens/Login/login_screen.dart';
import 'package:auto_select_candidate/Screens/forgot_password.dart/forgot_password_screen.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';


class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ForgotPasswordScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: backgroundColor, elevation: 0),
          child: Text(
            "Sign Up".toUpperCase(),
            style: TextStyle(color: blackColor),
          ),
        ),
      ],
    );
  }
}
