import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/program/screen/components/add_new_program_button.dart';
import 'package:auto_select_candidate/app/features/program/screen/components/edit_program_form.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllProgramScreen extends StatefulWidget {
  const AllProgramScreen({Key? key}) : super(key: key);

  @override
  State<AllProgramScreen> createState() => _AllProgramScreenState();
}

class _AllProgramScreenState extends State<AllProgramScreen> {
  var programController = ProgramController(ProgramRepository());
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
                  FutureBuilder<List<Program>>(
                    future: programController.fetchProgramList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Program>? data = snapshot.data;
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
                                      'Program List',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AddNewProgramButton(),
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
                                              'Country',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Country"),
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
                                              'Delete',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "Delete"),
                                      ],
                                      rows: data!
                                          .map(
                                            (program) => DataRow(
                                              cells: [
                                                DataCell(
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      program.name.toString(),
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
                                                      program.country
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
                                                      program.description
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
                                                      program.createdDate
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
                                                          getProgram(program.id
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

  getProgram(id) async {
    await programController.getProgramController(id).then((value) {
      if (value.id == id) {
        var id = value.id.toString();
        var name = value.name.toString();
        var country = value.country.toString();
        var description = value.description.toString();
        showSnackbar(context, Colors.green, 'Program get successful');
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
                      'Edit ${value.name} program',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  EditProgramForm(
                      id: id,
                      name: name,
                      country: country,
                      description: description),
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
