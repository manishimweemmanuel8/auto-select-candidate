import 'package:auto_select_candidate/Screens/Login/login_screen.dart';
import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
import 'package:auto_select_candidate/Screens/scholorship/all_scholorship_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_select_candidate/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSFAMS',
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: primaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: backgroundColor,
            iconColor: primaryColor,
            prefixIconColor: primaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(30)),
                // borderSide: BorderSide.none,
                ),
          )),
      home: const LoginScreen(),
    );
  }
}
