import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/all_combination.dart';
import 'package:auto_select_candidate/app/features/program/screen/all_program.dart';
import 'package:auto_select_candidate/app/features/scholorship/controller/scholorship_controller.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/scholorship_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class ScholorshipForm extends StatefulWidget {
  const ScholorshipForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ScholorshipForm> createState() => _ScholorshipFormState();
}

class _ScholorshipFormState extends State<ScholorshipForm> {
  final formKey = GlobalKey<FormState>();
  String names = '';
  String description = '';
  bool _isLoading = false;
  var scholorshipController = ScholorshipController(ScholorshipRepository());

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
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (name) {},
                  decoration: const InputDecoration(
                    hintText: "name",
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.text_fields)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      names = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Names cannot be empty';
                    }
                  },
                ),
                const SizedBox(height: defaultPadding),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (description) {},
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
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
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await scholorshipController
          .createScholoshipController(
              Scholorship(names: names, description: description))
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
