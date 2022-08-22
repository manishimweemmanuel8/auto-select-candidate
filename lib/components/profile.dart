import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Jean paul',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Logout",
                  style: TextStyle(fontSize: 10, color: primaryColor)),
            ),
          ],
        ),
        const SizedBox(
          width: defaultPadding * 3,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(22)),
          child: const Icon(
            Icons.person,
            color: backgroundColor,
          ),
        ),
      ],
    );
  }
}
