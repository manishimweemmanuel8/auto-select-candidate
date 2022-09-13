import 'package:auto_select_candidate/app/features/select/controller/select_controller.dart';
import 'package:auto_select_candidate/app/features/select/model/select.dart';
import 'package:auto_select_candidate/app/features/select/repository/select_repository.dart';
import 'package:auto_select_candidate/app/features/select/screen/components/add_criterial_form.dart';
import 'package:auto_select_candidate/app/features/select/screen/components/edit_select_form.dart';
import 'package:auto_select_candidate/components/app_logo.dart';
import 'package:auto_select_candidate/components/background.dart';
import 'package:auto_select_candidate/components/candidate_name.dart';
import 'package:auto_select_candidate/components/profile.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AllScholorshipSelectedScreen extends StatefulWidget {
  final String scholorshipId;
  const AllScholorshipSelectedScreen({Key? key, required this.scholorshipId})
      : super(key: key);

  @override
  State<AllScholorshipSelectedScreen> createState() =>
      _AllScholorshipSelectedScreenState();
}

class _AllScholorshipSelectedScreenState
    extends State<AllScholorshipSelectedScreen> {
  var selectController = SelectController(SelectRepository());
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
                  FutureBuilder<List<Select>>(
                    future: selectController
                        .fetchSelectList(widget.scholorshipId.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Select>? data = snapshot.data;
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
                                      ' selected List',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: primaryColor),
                                      child: ElevatedButton(
                                        child: const Text(
                                          'Make selection',
                                          style: TextStyle(
                                            color: whiteColor,
                                          ),
                                        ),
                                        onPressed: () async {
                                          makeSelection(
                                              widget.scholorshipId.toString());
                                        },
                                      ),
                                    ),
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
                                              'canidate',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "candidate"),
                                        DataColumn(
                                            label: Text(
                                              'interview status',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "interview status"),
                                        DataColumn(
                                            label: Text(
                                              'pass',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            numeric: false,
                                            tooltip: "pass"),
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
                                            (select) => DataRow(
                                              cells: [
                                                DataCell(
                                                  SizedBox(
                                                    width: 500,
                                                    child: CandidateName(
                                                        candidateId: select
                                                            .candidateId
                                                            .toString()),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      select.interviewStatus
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
                                                      select.pass.toString(),
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
                                                      select.createdDate
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
                                                          getSelect(select.id
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

  getSelect(id) async {
    await selectController.getSelectController(id).then((value) {
      if (value.id == id) {
        var id = value.id.toString();
        var interviewStatus = value.interviewStatus;
        var pass = value.pass;
        var scholorshipId = value.scholorshipId.toString();
        var candidateId = value.toString();
        showSnackbar(context, Colors.green,
            'Scholorship selected candindate get successful');
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
                      'Write email to send to the selected candidate',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  EditSelectForm(
                    id: id,
                    interviewStatus: interviewStatus!,
                    pass: pass!,
                    scholorshipId: scholorshipId,
                    candidateId: candidateId,
                  ),
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

  makeSelection(id) async {
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
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
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
                  'Edit scholorship selected candidate',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              SelectionForm(
                scholorshipId: id,
              ),
            ],
          ),
        );
      },
    );
  }
}
