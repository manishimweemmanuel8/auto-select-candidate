import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/combination/screen/all_combination.dart';
import 'package:auto_select_candidate/app/features/scholorship/controller/scholorship_controller.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/scholorship_repository.dart';
import 'package:auto_select_candidate/app/features/scholorship/screen/all_scholorship.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class EditScholorshipForm extends StatefulWidget {
  final String id;
  final String names;
  final String description;

  const EditScholorshipForm({
    Key? key,
    required this.id,
    required this.names,
    required this.description,
  }) : super(key: key);

  @override
  State<EditScholorshipForm> createState() => _EditScholorshipFormState();
}

class _EditScholorshipFormState extends State<EditScholorshipForm> {
  final formKey = GlobalKey<FormState>();
  var scholorshipId = '';
  final TextEditingController _controllerDescription =
      new TextEditingController();
  final TextEditingController _controllerNames = new TextEditingController();
  @override
  void initState() {
    setState(() {
      scholorshipId = widget.id;
      _controllerNames.text = widget.names;
      _controllerDescription.text = widget.description;
    });

    super.initState();
  }

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
                  controller: _controllerNames,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: primaryColor,
                  onSaved: (name) {},
                  decoration: const InputDecoration(
                    hintText: "names",
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.text_fields)),
                  ),
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
    var names = _controllerNames.text;
    var description = _controllerDescription.text;
    if (names.isNotEmpty &&  description.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await scholorshipController
          .updateScholorShipController(
              Scholorship(names: names, description: description),
              scholorshipId)
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
