import 'package:auto_select_candidate/Screens/scholorship/components/scholorship_data_table.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllScholorshipScreen extends StatefulWidget {
  const AllScholorshipScreen({Key? key}) : super(key: key);

  @override
  State<AllScholorshipScreen> createState() => _AllScholorshipScreenState();
}

class _AllScholorshipScreenState extends State<AllScholorshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
            top: defaultPadding,
            right: defaultPadding * 3,
            left: defaultPadding * 3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [AppLogo(), Profile()],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            const ScholorshipDataTable(),
          ],
        ),
      ),
    ));
  }
}
