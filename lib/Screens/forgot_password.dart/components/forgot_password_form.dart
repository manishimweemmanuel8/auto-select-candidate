import 'package:auto_select_candidate/Screens/Login/login_screen.dart';
import 'package:auto_select_candidate/components/forgot_password_check.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          ElevatedButton(
            onPressed: () {},
            child: Text("Subimt".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ForgotPasswordCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
