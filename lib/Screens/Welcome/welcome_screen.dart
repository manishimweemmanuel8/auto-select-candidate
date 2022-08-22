import 'package:auto_select_candidate/Screens/Welcome/components/add_new_program_button.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/scholorship/add_new_scholorship_button.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/candindate_dashboard.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/last_scholorship.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/combination_header.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/program_card.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/recent_combination.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/recent_scholorship.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/statistics.dart';
import 'package:auto_select_candidate/Screens/scholorship/all_scholorship_screen.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: getBody(),
    );
  }

  // Widget createAndViewScholorship() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10, right: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         Container(
  //           height: 40,
  //           width: 150,
  //           decoration: BoxDecoration(
  //             color: primaryColor.withOpacity(0.2),
  //             borderRadius: BorderRadius.circular(22),
  //           ),
  //           child: const Center(
  //             child: Text(
  //               'Create scholorship',
  //               style:
  //                   TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //           height: 40,
  //           width: 150,
  //           decoration: BoxDecoration(
  //             color: primaryColor.withOpacity(0.2),
  //             borderRadius: BorderRadius.circular(22),
  //           ),
  //           child: const Center(
  //             child: Text(
  //               'View scholorships',
  //               style:
  //                   TextStyle(color: blackColor, fontWeight: FontWeight.w500),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget getBody() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: getLeftContent(),
        ),
        Expanded(
          child: getCenterContent(),
        ),
        Expanded(
          child: getRightContent(),
        ),
      ],
    );
  }

  Widget getLeftContent() {
    return Container(
      padding: const EdgeInsets.all(30),
      width: 450,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.03),
      ),
      child: Column(
        children: [
          const AppLogo(),
          const SizedBox(height: 30),
          getScholorshipHeader(),
          const SizedBox(height: 20),
          const LastScholorShip(),
          const SizedBox(height: 20),
          const RecentScholorship(),
          const SizedBox(height: 20),
          const RecentScholorship(),
          const SizedBox(height: 20),
          const RecentScholorship(),
          const SizedBox(height: 20),
          const AddNewScholorShipButton(),
        ],
      ),
    );
  }

  Widget getScholorshipHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Recent scholorship",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AllScholorshipScreen();
                  },
                ),
              );
            },
            child: const Text(
              "View all",
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }

  Widget getCenterContent() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        children: [
          //Program header
          const CombinationHeaderPage(),
          const SizedBox(height: 30),
          const RecentCombination(
              combination: "Physics Chemistry Biology", abbreviation: "pcb"),
          const SizedBox(height: 20),
          const RecentCombination(
              combination: "Mathematics Chemistry Biology",
              abbreviation: "mcb"),

          const SizedBox(height: 20),
          Container(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "View Programs",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 30),

          const ProgramCard(
              program: 'REB',
              country: 'Rwanda',
              studyYears: '3',
              studyLanguage: 'English'),
          const SizedBox(height: 20),
          const ProgramCard(
              program: 'cambridge',
              country: 'Rwanda',
              studyYears: '3',
              studyLanguage: 'English'),

          const SizedBox(height: 20),
          const AddNewProgramButton(),
        ],
      ),
    );
  }

  Widget getRightContent() {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      width: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 250, top: 30, right: 50),
            child: const Profile(),
          ),
          const SizedBox(height: 70),
          const Statistic(name: "ScholorShip", count: "15"),
          const SizedBox(height: 20),
          const Statistic(name: "Combination", count: "30"),
          const SizedBox(height: 20),
          const Statistic(name: "Program", count: "3"),
          const SizedBox(height: 20),
          const CandidateDashboard(),
        ],
      ),
    );
  }
}

// class MobileWelcomeScreen extends StatelessWidget {
//   const MobileWelcomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const WelcomeImage(),
//         Row(
//           children: const [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: LoginAndSignupBtn(),
//             ),
//             Spacer(),
//           ],
//         ),
//       ],
//     );
//   }
// }
