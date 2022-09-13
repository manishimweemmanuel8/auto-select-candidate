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

class EditCriterialForm extends StatefulWidget {
  final String id;
  final int marksFrom;
  final int marksTo;
  final String scholorshipId;
  final String programId;
  final String combinationId;

  const EditCriterialForm({
    Key? key,
    required this.id,
    required this.marksFrom,
    required this.marksTo,
    required this.scholorshipId,
    required this.programId,
    required this.combinationId,
  }) : super(key: key);

  @override
  State<EditCriterialForm> createState() => _EditCriterialFormState();
}

class _EditCriterialFormState extends State<EditCriterialForm> {
  final formKey = GlobalKey<FormState>();
  var criterialId = '';
  String programId = '';
  String combinationId = '';
  final TextEditingController _controllerMarksFrom =
      new TextEditingController();
  final TextEditingController _controllerMarksTo = new TextEditingController();
  final TextEditingController _controllerScholorshipId =
      new TextEditingController();
  final TextEditingController _controllerProgramId =
      new TextEditingController();
  final TextEditingController _controllerCombinationId =
      new TextEditingController();

  var criterilController = CriterialController(CriterialRepository());
  var programController = ProgramController(ProgramRepository());
  var combinationController = CombinationController(CombinationRepository());
  @override
  void initState() {
    setState(() {
      criterialId = widget.id.toString();
      programId = widget.programId;
      combinationId = widget.combinationId;
      _controllerMarksFrom.text = widget.marksFrom.toString();
      _controllerMarksTo.text = widget.marksTo.toString();
      _controllerScholorshipId.text = widget.scholorshipId;
      _controllerCombinationId.text = widget.combinationId;
      _controllerProgramId.text = widget.programId;
    });

    super.initState();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Column(
              children: [
                TextFormField(
                  controller: _controllerMarksFrom,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (marksFrom) {},
                  decoration: const InputDecoration(
                    hintText: "Marks form",
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.text_fields)),
                  ),
                  // validator: (value) {
                  //   if (value!.isNotEmpty) {
                  //     return null;
                  //   } else {
                  //     return 'Marks from cannot be empty';
                  //   }
                  // },
                ),
                const SizedBox(height: defaultPadding),
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (marksTo) {},
                  decoration: const InputDecoration(
                    hintText: "Marks to ",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                  controller: _controllerMarksTo,

                  // check tha validation
                  // validator: (value) {
                  //   if (value!.isNotEmpty) {
                  //     return null;
                  //   } else {
                  //     return 'Marks to cannot be empty';
                  //   }
                  // },
                ),
                // const SizedBox(height: defaultPadding),
                // FutureBuilder<List<Program>>(
                //   future: programController.fetchProgramList(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       List<Program>? data = snapshot.data;
                //       // print(data);
                //       return DropdownButtonFormField(
                //           decoration: const InputDecoration(
                //             prefixIcon: Padding(
                //               padding: EdgeInsets.all(defaultPadding),
                //               child: Icon(Icons.text_fields),
                //             ),
                //           ),
                //           hint: Text("Select Program"),
                //           isExpanded: true,
                //           items: data!.map((program) {
                //             return DropdownMenuItem(
                //               child: Text(program.name.toString()),
                //               value: program.id.toString(),
                //             );
                //           }).toList(),
                //           onChanged: (value) {
                //             print("Selected Program is $value");
                //             programId = value.toString();
                //           });
                //     } else if (snapshot.hasError) {
                //       showSnackbar(context, Colors.red, '${snapshot.error}');
                //     }
                //     return Center(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: const [
                //           CircularProgressIndicator(
                //             color: primaryColor,
                //           ),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Text('This may take some time..'),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                // const SizedBox(height: defaultPadding),
                // FutureBuilder<List<Combination>>(
                //   future: combinationController.fetchCombinationList(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       List<Combination>? data = snapshot.data;
                //       // print(data);
                //       return DropdownButtonFormField(
                //           decoration: const InputDecoration(
                //             prefixIcon: Padding(
                //               padding: EdgeInsets.all(defaultPadding),
                //               child: Icon(Icons.text_fields),
                //             ),
                //           ),
                //           hint: Text("Select Combination"),
                //           isExpanded: true,
                //           items: data!.map((combination) {
                //             return DropdownMenuItem(
                //               child: Text(combination.name.toString()),
                //               value: combination.id.toString(),
                //             );
                //           }).toList(),
                //           onChanged: (value) {
                //             print("Selected Program is $value");
                //             combinationId = value.toString();
                //           });
                //     } else if (snapshot.hasError) {
                //       showSnackbar(context, Colors.red, '${snapshot.error}');
                //     }
                //     return Center(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: const [
                //           CircularProgressIndicator(
                //             color: primaryColor,
                //           ),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Text('This may take some time..'),
                //         ],
                //       ),
                //     );
                //   },
                // ),
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
    );
  }

  register() async {
    int marksFrom = int.parse(_controllerMarksFrom.text);
    int marksTo = int.parse(_controllerMarksTo.text);
    var scholorshipId = _controllerScholorshipId.text;
    var programId = _controllerProgramId.text;
    var combinationId = _controllerCombinationId.text;
    if (scholorshipId.isNotEmpty &&
        programId.isNotEmpty &&
        combinationId.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await criterilController
          .updateCriterialController(
              Criterial(
                marksFrom: marksFrom,
                marksTo: marksTo,
                scholorshipId: scholorshipId,
                programId: programId,
                combinationId: combinationId,
              ),
              criterialId)
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Scholorship Updated successful');
          nextScreenReplace(context, const AllScholorshipScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to Update new combination');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
