import 'package:auto_select_candidate/app/features/criterial/controller/criterial_controller.dart';
import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';
import 'package:auto_select_candidate/app/features/criterial/repository/criterial_repository.dart';
import 'package:auto_select_candidate/app/features/criterial/screen/components/add_new_creterial_button.dart';
import 'package:auto_select_candidate/app/features/criterial/screen/components/edit_criterial_form.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/combination_name.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/program_name.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllScholorshipCriterialScreen extends StatefulWidget {
  final String scholorshipId;
  const AllScholorshipCriterialScreen({Key? key, required this.scholorshipId})
      : super(key: key);

  @override
  State<AllScholorshipCriterialScreen> createState() =>
      _AllScholorshipCriterialScreenState();
}

class _AllScholorshipCriterialScreenState
    extends State<AllScholorshipCriterialScreen> {
  var criterilController = CriterialController(CriterialRepository());
  bool _isLoading = false;

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
                  FutureBuilder<List<Criterial>>(
                    future: criterilController
                        .fetchCriterialList(widget.scholorshipId.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Criterial>? data = snapshot.data;
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
                                  children: [
                                    const Text(
                                      'Scholorship criterial List',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AddNewCriterialButton(
                                        scholorshipId:
                                            widget.scholorshipId.toString()),
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
                                              'mark from',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "marks from"),
                                        DataColumn(
                                            label: Text(
                                              'marks to',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "marks to"),
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
                                        DataColumn(
                                            label: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Edit"),
                                      ],
                                      rows: data!
                                          .map(
                                            (criterial) => DataRow(
                                              cells: [
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      criterial.marksFrom
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
                                                    width: 100,
                                                    child: Text(
                                                      criterial.marksTo
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
                                                          programId: criterial
                                                              .programId
                                                              .toString())),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                      width: 300,
                                                      child: CombinationName(
                                                          combintaionId:
                                                              criterial
                                                                  .combinationId
                                                                  .toString())),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      criterial.createdDate
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
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          getCriterial(criterial
                                                              .id
                                                              .toString());
                                                        },
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color: primaryColor,
                                                        )),
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

  getCriterial(id) async {
    await criterilController.getCriterialController(id).then((value) {
      if (value.id == id) {
        var id = value.id.toString();
        var marksFrom = value.marksFrom!.toString();
        var marksTo = value.marksTo!.toString();
        var scholorshipId = value.scholorshipId.toString();
        var programId = value.programId.toString();
        var combinationId = value.combinationId.toString();
        showSnackbar(
            context, Colors.green, 'Scholorship criterial get successful');
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          backgroundColor: whiteColor,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.only(left: 500, top: 20, right: 500),
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                color: primaryColor.withOpacity(0.05),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: primaryColor,
                          )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(
                      'Edit scholorship criterial',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  EditCriterialForm(
                      id: id,
                      marksFrom: int.parse(marksFrom),
                      marksTo: int.parse(marksTo),
                      scholorshipId: scholorshipId,
                      programId: programId,
                      combinationId: combinationId),
                ],
              ),
            );
          },
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackbar(context, Colors.red, 'Fail to get criterial');
      }
    });
  }
}
