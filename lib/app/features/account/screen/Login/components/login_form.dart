import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
import 'package:auto_select_candidate/app/features/account/controller/user_controller.dart';
import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/account/repository/user_repository.dart';
import 'package:auto_select_candidate/app/features/account/screen/forgot_password.dart/forgot_password_screen.dart';
import 'package:auto_select_candidate/components/forgot_password_check.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  String userName = '';
  String password = '';
  bool _isLoading = false;
  // AuthService authService=AuthService();
  var userController = UserController(UserRepository());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    hintText: "Your username",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'username cannot be empty';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: primaryColor,
                    decoration: const InputDecoration(
                      hintText: "Your password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Hero(
                  tag: "login_btn",
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                ForgotPasswordCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPasswordScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await userController
          .loginController(User(username: userName, password: password))
          .then((value) async {
        if (value == true) {
          nextScreenReplace(context, const WelcomeScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to login');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
