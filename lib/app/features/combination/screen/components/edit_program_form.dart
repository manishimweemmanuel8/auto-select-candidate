import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/all_combination.dart';
import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/program/screen/all_program.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class EditCombinationForm extends StatefulWidget {
  final String id;
  final String name;
  final String abbreviation;
  final String description;

  const EditCombinationForm({
    Key? key,
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.description,
  }) : super(key: key);

  @override
  State<EditCombinationForm> createState() => _EditCombinationFormState();
}

class _EditCombinationFormState extends State<EditCombinationForm> {
  final formKey = GlobalKey<FormState>();
  var combinationId = '';
  final TextEditingController _controllerAbbreviation = new TextEditingController();
  final TextEditingController _controllerDescription =
      new TextEditingController();
  final TextEditingController _controllerName = new TextEditingController();
  @override
  void initState() {
    setState(() {
      combinationId = widget.id;
      _controllerName.text = widget.name;
      _controllerAbbreviation.text = widget.abbreviation;
      _controllerDescription.text = widget.description;
    });

    super.initState();
  }

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
                  controller: _controllerName,
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
                  controller: _controllerAbbreviation,

                  // check tha validation
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Abbreviation cannot be empty';
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
                  controller: _controllerDescription,

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
    var name = _controllerName.text;
    var abbreviation = _controllerAbbreviation.text;
    var description = _controllerDescription.text;
    if (name.isNotEmpty && abbreviation.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await combinationController
          .updateCombinationController(
              Combination(name: name, abbreviation: abbreviation, description: description),
              combinationId)
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Combination Updated successful');
          nextScreenReplace(context, const AllCombinationScreen());
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
