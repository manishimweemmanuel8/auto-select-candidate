import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/all_combination.dart';
import 'package:auto_select_candidate/app/features/program/screen/all_program.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class CombinationForm extends StatefulWidget {
  const CombinationForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CombinationForm> createState() => _CombinationFormState();
}

class _CombinationFormState extends State<CombinationForm> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String abbreviation = '';
  String description = '';
  bool _isLoading = false;
  var combinationController = CombinationController(CombinationRepository());

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
                      name = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Name cannot be empty';
                    }
                  },
                ),
                const SizedBox(height: defaultPadding),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (abbreviation) {},
                  decoration: const InputDecoration(
                    hintText: "Abbreviation",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      abbreviation = value;
                    });
                  },

                  // check tha validation
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'abbreviation cannot be empty';
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

      await combinationController
          .createCombinationController(Combination(
              name: name, abbreviation: abbreviation, description: description))
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Program created successful');
          nextScreenReplace(context, const AllCombinationScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to create new Program');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
