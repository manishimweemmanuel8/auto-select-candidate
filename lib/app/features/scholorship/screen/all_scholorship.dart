import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/components/add_new_combination_button.dart';
import 'package:auto_select_candidate/app/features/combination/screen/components/edit_program_form.dart';
import 'package:auto_select_candidate/app/features/criterial/screen/all_scholorship_criterial.dart';
import 'package:auto_select_candidate/app/features/program/screen/components/add_new_program_button.dart';
import 'package:auto_select_candidate/app/features/scholorship/controller/scholorship_controller.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/scholorship_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/components/edit_scholorship_form.dart';
import 'package:auto_select_candidate/app/features/select/screen/all_scholorship_selected.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllScholorshipScreen extends StatefulWidget {
  const AllScholorshipScreen({Key? key}) : super(key: key);

  @override
  State<AllScholorshipScreen> createState() => _AllScholorshipScreenState();
}

class _AllScholorshipScreenState extends State<AllScholorshipScreen> {
  var scholorshipController = ScholorshipController(ScholorshipRepository());
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
                  FutureBuilder<List<Scholorship>>(
                    future: scholorshipController.fetchScholorShipList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Scholorship>? data = snapshot.data;
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
                                      'Scholorship List',
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
                                              'Name',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Name"),
                                        DataColumn(
                                            label: Text(
                                              'Description',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Description"),
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
                                        DataColumn(
                                            label: Text(
                                              'Criterial',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Criterial"),
                                        DataColumn(
                                            label: Text(
                                              'Select',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Select"),
                                      ],
                                      rows: data!
                                          .map(
                                            (scholorship) => DataRow(
                                              cells: [
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      scholorship.names
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
                                                    width: 500,
                                                    child: Text(
                                                      scholorship.description
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
                                                      scholorship.createdDate
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
                                                          getScholorship(
                                                              scholorship.id
                                                                  .toString());
                                                        },
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color: primaryColor,
                                                        )),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          nextScreenReplace(
                                                              context,
                                                              AllScholorshipCriterialScreen(
                                                                  scholorshipId:
                                                                      scholorship
                                                                          .id
                                                                          .toString()));
                                                        },
                                                        child: const Text(
                                                          'Criterial',
                                                          style: TextStyle(
                                                            color: primaryColor,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          nextScreenReplace(
                                                              context,
                                                              AllScholorshipSelectedScreen(
                                                                  scholorshipId:
                                                                      scholorship
                                                                          .id
                                                                          .toString()));
                                                        },
                                                        child: const Text(
                                                          'Select',
                                                          style: TextStyle(
                                                            color: primaryColor,
                                                          ),
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

  getScholorship(id) async {
    print(id);
    await scholorshipController.getScholorshipController(id).then((value) {
      if (value.id == id) {
        var id = value.id.toString();
        var names = value.names.toString();
        var description = value.description.toString();
        showSnackbar(context, Colors.green, 'Scholorship get successful');
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
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(
                      'Edit ${value.names} scholorship',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  EditScholorshipForm(
                      id: id, names: names, description: description),
                ],
              ),
            );
          },
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackbar(context, Colors.red, 'Fail to delete Program');
      }
    });
  }
}
