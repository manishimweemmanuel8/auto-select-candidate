import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
import 'package:auto_select_candidate/Screens/scholorship/all_scholorship_screen.dart';
import 'package:auto_select_candidate/app/features/account/screen/user/all_user.dart';
import 'package:auto_select_candidate/Screens/user/users_screen.dart';
import 'package:auto_select_candidate/app/features/account/screen/Login/login_screen.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:auto_select_candidate/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_select_candidate/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  String _token = '';

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });

    await HelperFunctions.getUserAccessTokenFromSF().then((value) {
      if (value != null) {
        setState(() {
          _token = value;
        });
      }
    });
  }

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
      home: _isSignedIn ? const WelcomeScreen() : const LoginScreen(),
    );
  }
}
