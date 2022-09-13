import 'package:auto_select_candidate/Screens/Welcome/components/candindate_dashboard.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/combination_header.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/last_scholorship.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/program_card.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/recent_combination.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/recent_scholorship.dart';
import 'package:auto_select_candidate/Screens/Welcome/components/statistics.dart';
import 'package:auto_select_candidate/app/features/account/controller/user_controller.dart';
import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/account/repository/user_repository.dart';
import 'package:auto_select_candidate/app/features/account/screen/user/all_user.dart';
import 'package:auto_select_candidate/app/features/candidate/controller/candidate_controller.dart';
import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';
import 'package:auto_select_candidate/app/features/candidate/repository/candidate_repository.dart';
import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/all_combination.dart';
import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/program/screen/all_program.dart';
import 'package:auto_select_candidate/app/features/scholorship/controller/scholorship_controller.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/scholorship_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/components/add_new_scholorship_button.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var userController = UserController(UserRepository());
  var programController = ProgramController(ProgramRepository());
  var combinationController = CombinationController(CombinationRepository());
  var candidateController = CandidateController(CandidateRepository());
  var scholorshipController = ScholorshipController(ScholorshipRepository());
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInRole();
  }

  getUserLoggedInRole() async {
    await HelperFunctions.getUserRoleFromSF().then((value) {
      if (value != null && value == 'ADMIN') {
        setState(() {
          isAdmin = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: getBody(),
    );
  }

  Widget getBody() {
    return Row(
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
          FutureBuilder<List<Scholorship>>(
            future: scholorshipController.fetchLastScholorShipList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Scholorship>? data = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: data!
                      .map<Widget>(
                        (scholorship) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LastScholorShip(
                              name: scholorship.names.toString(),
                              date: scholorship.createdDate.toString(),
                              description: scholorship.description.toString()),
                        ),
                      )
                      .toList(),
                );
              } else if (snapshot.hasError) {
                showSnackbar(context, Colors.red, '${snapshot.error}');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('This may take some time..'),
                  ],
                ),
              );
            },
          ),
          // const LastScholorShip(),
          const SizedBox(height: 20),
          FutureBuilder<List<Scholorship>>(
            future: scholorshipController.fetchRecentScholorShipList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Scholorship>? data = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: data!
                      .map<Widget>(
                        (scholorship) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RecentScholorship(
                            names: scholorship.names.toString(),
                            date: scholorship.createdDate.toString(),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else if (snapshot.hasError) {
                showSnackbar(context, Colors.red, '${snapshot.error}');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('This may take some time..'),
                  ],
                ),
              );
            },
          ),
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
              nextScreenReplace(context, AllScholorshipScreen());
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
          //Combination header
          FutureBuilder<List<Combination>>(
              future: combinationController.fetchCombinationList(),
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    nextScreenReplace(context, const AllCombinationScreen());
                  },
                  child:
                      CombinationHeaderPage(count: snapshot.data?.length ?? 0),
                );
              }),
          const SizedBox(height: 30),

          FutureBuilder<List<Combination>>(
            future: combinationController.fetchtwoLatestCombinationList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Combination>? data = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: data!
                      .map<Widget>(
                        (combination) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RecentCombination(
                              combination: combination.name.toString(),
                              abbreviation:
                                  combination.abbreviation.toString()),
                        ),
                      )
                      .toList(),
                );
              } else if (snapshot.hasError) {
                showSnackbar(context, Colors.red, '${snapshot.error}');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('This may take some time..'),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 20),
          Container(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                nextScreenReplace(context, const AllProgramScreen());
              },
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

          FutureBuilder<List<Program>>(
            future: programController.fetchLastTwoProgramList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Program>? data = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: data!
                      .map<Widget>(
                        (program) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProgramCard(
                            program: program.name.toString(),
                            country: program.country.toString(),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else if (snapshot.hasError) {
                showSnackbar(context, Colors.red, '${snapshot.error}');
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('This may take some time..'),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),
          // const AddNewProgramButton(),
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
          isAdmin
              ? FutureBuilder<List<User>>(
                  future: userController.fetchUserList(),
                  builder: (context, snapshot) {
                    return InkWell(
                      onTap: () {
                        nextScreenReplace(context, const AllUserScreen());
                      },
                      child: Statistic(
                          name: "User", count: snapshot.data?.length ?? 0),
                    );
                  })
              : const Text(''),
          const SizedBox(height: 20),
          FutureBuilder<List<Program>>(
              future: programController.fetchProgramList(),
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    nextScreenReplace(context, const AllProgramScreen());
                  },
                  child: Statistic(
                      name: "Program", count: snapshot.data?.length ?? 0),
                );
              }),
          const SizedBox(height: 20),
          FutureBuilder<List<Combination>>(
              future: combinationController.fetchCombinationList(),
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    nextScreenReplace(context, const AllCombinationScreen());
                  },
                  child: Statistic(
                      name: "Combination", count: snapshot.data?.length ?? 0),
                );
              }),
          const SizedBox(height: 20),
          FutureBuilder<List<Candidate>>(
              future: candidateController.fetchCandidateList(),
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    nextScreenReplace(context, const AllCombinationScreen());
                  },
                  child: CandidateDashboard(count: snapshot.data?.length ?? 0),
                );
              }),
        ],
      ),
    );
  }
}
