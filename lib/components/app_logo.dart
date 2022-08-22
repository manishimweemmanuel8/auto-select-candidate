import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WelcomeScreen();
            },
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(20)),
            ),
            child: const Icon(
              Icons.school,
              color: backgroundColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "SSFAMS",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
