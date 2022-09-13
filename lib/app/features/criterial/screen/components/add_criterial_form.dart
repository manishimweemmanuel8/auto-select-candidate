import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/criterial/controller/criterial_controller.dart';
import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';
import 'package:auto_select_candidate/app/features/criterial/repository/criterial_repository.dart';
import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CriterialForm extends StatefulWidget {
  final String scholorshipId;
  const CriterialForm({
    Key? key,
    required this.scholorshipId,
  }) : super(key: key);

  @override
  State<CriterialForm> createState() => _CriterialFormState();
}

class _CriterialFormState extends State<CriterialForm> {
  final formKey = GlobalKey<FormState>();
  String programId = '';
  String combinationId = '';
  bool _isLoading = false;
  var criterilController = CriterialController(CriterialRepository());
  var programController = ProgramController(ProgramRepository());
  var combinationController = CombinationController(CombinationRepository());

  final TextEditingController _marksFromController =
      new TextEditingController();
  final TextEditingController _marksToController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textInputAction: TextInputAction.next,
                    controller: _marksFromController,
                    cursorColor: primaryColor,
                    onSaved: (marksFrom) {},
                    decoration: const InputDecoration(
                      hintText: "Marks from",
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.text_fields)),
                    ),
                    onChanged: (value) {},
                    // validator: (value) {
                    //   if (value!.isNotEmpty) {
                    //     return null;
                    //   } else {
                    //     return 'marks from cannot be empty';
                    //   }
                    // },
                  ),
                  const SizedBox(height: defaultPadding),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: _marksToController,
                    cursorColor: primaryColor,
                    onSaved: (marksTo) {},
                    decoration: const InputDecoration(
                      hintText: "Marks to",
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.text_fields)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'marks to cannot be empty';
                      }
                    },
                  ),
                  const SizedBox(height: defaultPadding),
                  FutureBuilder<List<Program>>(
                    future: programController.fetchProgramList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Program>? data = snapshot.data;
                        // print(data);
                        return DropdownButtonFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Icon(Icons.text_fields),
                              ),
                            ),
                            hint: Text("Select Program"),
                            isExpanded: true,
                            items: data!.map((program) {
                              return DropdownMenuItem(
                                child: Text(program.name.toString()),
                                value: program.id.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print("Selected Program is $value");
                              programId = value.toString();
                            });
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
                  const SizedBox(height: defaultPadding),
                  FutureBuilder<List<Combination>>(
                    future: combinationController.fetchCombinationList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Combination>? data = snapshot.data;
                        // print(data);
                        return DropdownButtonFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Icon(Icons.text_fields),
                              ),
                            ),
                            hint: Text("Select Combination"),
                            isExpanded: true,
                            items: data!.map((combination) {
                              return DropdownMenuItem(
                                child: Text(combination.name.toString()),
                                value: combination.id.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print("Selected Program is $value");
                              combinationId = value.toString();
                            });
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
                  const SizedBox(height: defaultPadding),
                  ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Submit".toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await criterilController
          .createCriterialController(Criterial(
              marksFrom: int.parse(_marksFromController.text),
              marksTo: int.parse(_marksToController.text),
              scholorshipId: widget.scholorshipId.toString(),
              programId: programId,
              combinationId: combinationId))
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Scholorship created successful');
          nextScreenReplace(context, const AllScholorshipScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to create new Scholorship');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
