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
import 'package:auto_select_candidate/app/features/select/controller/select_controller.dart';
import 'package:auto_select_candidate/app/features/select/model/select.dart';
import 'package:auto_select_candidate/app/features/select/repository/select_repository.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectionForm extends StatefulWidget {
  final String scholorshipId;
  const SelectionForm({
    Key? key,
    required this.scholorshipId,
  }) : super(key: key);

  @override
  State<SelectionForm> createState() => _SelectionFormState();
}

class _SelectionFormState extends State<SelectionForm> {
  final formKey = GlobalKey<FormState>();
  String emailMessage = '';
  bool _isLoading = false;

  var selectController = SelectController(SelectRepository());

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
                    textInputAction: TextInputAction.next,
                    cursorColor: primaryColor,
                    onSaved: (emailMesssage) {},
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: "Email message",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.text_fields),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        emailMessage = value;
                      });
                    },

                    // check tha validation
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Description cannot be empty';
                      }
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

      await selectController
          .createSelectController(Select(
              scholorshipId: widget.scholorshipId.toString(),
              emailMessage: emailMessage))
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Select done successful');
          nextScreenReplace(context, const AllScholorshipScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to create selection');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
