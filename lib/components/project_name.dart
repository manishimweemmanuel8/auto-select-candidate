import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class ProjectName extends StatelessWidget {
  const ProjectName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "SSFAMS",
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: primaryColor),
    );
  }
}
