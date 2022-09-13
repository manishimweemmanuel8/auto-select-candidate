import 'package:auto_select_candidate/app/features/candidate/controller/candidate_controller.dart';
import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';
import 'package:auto_select_candidate/app/features/candidate/repository/candidate_repository.dart';
import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/components/add_new_combination_button.dart';
import 'package:auto_select_candidate/app/features/combination/screen/components/edit_program_form.dart';
import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/program/screen/components/add_new_program_button.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/combination_name.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/program_name.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllCandidateScreen extends StatefulWidget {
  const AllCandidateScreen({Key? key}) : super(key: key);

  @override
  State<AllCandidateScreen> createState() => _AllCandidateScreenState();
}

class _AllCandidateScreenState extends State<AllCandidateScreen> {
  var candidateController = CandidateController(CandidateRepository());
  var programController = ProgramController(ProgramRepository());
  bool _isLoading = false;
  String program = '';

  getProgramName(progamId) {
    programController.getProgramController(progamId).then((value) {
      if (progamId == value.id.toString()) {
        var program = value.name.toString();
        print(program);
      }
    });
    // return program;

    // print(program);
  }
  // print(program);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppLogo(),
                      Profile(),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FutureBuilder<List<Candidate>>(
                    future: candidateController.fetchCandidateList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Candidate>? data = snapshot.data;
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Candidate List',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // AddNewCombinationButton(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      sortAscending: true,
                                      sortColumnIndex: 0,
                                      columns: const [
                                        DataColumn(
                                            label: Text(
                                              'Names',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Names"),
                                        DataColumn(
                                            label: Text(
                                              'email',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "email"),
                                        DataColumn(
                                            label: Text(
                                              'marks',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "marks"),
                                        DataColumn(
                                            label: Text(
                                              'Program',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Program"),
                                        DataColumn(
                                            label: Text(
                                              'Combination',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Combination"),
                                        DataColumn(
                                            label: Text(
                                              'Created date',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Created date"),
                                      ],
                                      rows: data!
                                          .map(
                                            (candidate) => DataRow(
                                              cells: [
                                                DataCell(
                                                  SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                      candidate.names
                                                          .toString(),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      candidate.email
                                                          .toString(),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 50,
                                                    child: Text(
                                                      candidate.marks
                                                          .toString(),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 200,
                                                    child: ProgramName(
                                                        programId: candidate
                                                            .programId
                                                            .toString()),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 150,
                                                    child: CombinationName(
                                                        combintaionId: candidate
                                                            .combinationId
                                                            .toString()),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      candidate.createdDate
                                                          .toString()
                                                          .substring(0, 10),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                ],
              ),
            ),
    );
  }
}
