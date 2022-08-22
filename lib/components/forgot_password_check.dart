import 'package:flutter/material.dart';
import 'package:auto_select_candidate/constants.dart';

class ForgotPasswordCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const ForgotPasswordCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? "Don’t you remember your password ? "
              : "Already have an Account ? ",
          style: const TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Forgot password" : "Sign In",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
