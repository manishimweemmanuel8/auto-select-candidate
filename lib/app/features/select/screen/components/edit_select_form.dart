import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/criterial/controller/criterial_controller.dart';
import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';
import 'package:auto_select_candidate/app/features/criterial/repository/criterial_repository.dart';
import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/app/features/select/controller/select_controller.dart';
import 'package:auto_select_candidate/app/features/select/model/select.dart';
import 'package:auto_select_candidate/app/features/select/repository/select_repository.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditSelectForm extends StatefulWidget {
  final String id;
  final bool interviewStatus;
  final bool pass;
  final String scholorshipId;
  final String candidateId;

  const EditSelectForm({
    Key? key,
    required this.id,
    required this.interviewStatus,
    required this.pass,
    required this.scholorshipId,
    required this.candidateId,
  }) : super(key: key);

  @override
  State<EditSelectForm> createState() => _EditSelectFormState();
}

class _EditSelectFormState extends State<EditSelectForm> {
  final formKey = GlobalKey<FormState>();
  var selectId = '';
  String scholorshipId = '';
  String candidateId = '';
  bool interviewStatus = false;
  bool pass = false;

  var selectController = SelectController(SelectRepository());

  @override
  void initState() {
    setState(() {
      selectId = widget.id.toString();
      scholorshipId = widget.scholorshipId;
      candidateId = widget.candidateId;
      interviewStatus = widget.interviewStatus;
      pass = widget.pass;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: interviewStatus,
                          onChanged: (value) {
                            setState(() {
                              interviewStatus = value!;
                            });
                          },
                        ),
                        const Text('Interview status'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: pass,
                          onChanged: (value) {
                            setState(() {
                              pass = value!;
                            });
                          },
                        ),
                        const Text('Pass status'),
                      ],
                    ),
                  ],
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
    );
  }

  register() async {
    // bool interviewStatus = interviewStatus;
    // var pass = widget.pass;
    var scholorshipId = widget.scholorshipId;
    var candidateId = widget.candidateId;
    if (scholorshipId.isNotEmpty && candidateId.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await selectController
          .updateSelectController(
              Select(
                interviewStatus: interviewStatus,
                pass: pass,
                scholorshipId: scholorshipId,
                candidateId: candidateId,
              ),
              selectId)
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
