import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:auto_select_candidate/app/features/program/screen/all_program.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class EditProgramForm extends StatefulWidget {
  final String id;
  final String name;
  final String country;
  final String description;

  const EditProgramForm({
    Key? key,
    required this.id,
    required this.name,
    required this.country,
    required this.description,
  }) : super(key: key);

  @override
  State<EditProgramForm> createState() => _EditProgramFormState();
}

class _EditProgramFormState extends State<EditProgramForm> {
  final formKey = GlobalKey<FormState>();
  var programId = '';
  final TextEditingController _controllerCountry = new TextEditingController();
  final TextEditingController _controllerDescription =
      new TextEditingController();
  final TextEditingController _controllerName = new TextEditingController();
  @override
  void initState() {
    var id = widget.id;
    setState(() {
      programId = widget.id;
      _controllerName.text = widget.name;
      _controllerCountry.text = widget.country;
      _controllerDescription.text = widget.description;
    });

    super.initState();
  }

  bool _isLoading = false;
  var programController = ProgramController(ProgramRepository());

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
                  onSaved: (country) {},
                  decoration: const InputDecoration(
                    hintText: "Country",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                  controller: _controllerCountry,

                  // check tha validation
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Country cannot be empty';
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
    var country = _controllerCountry.text;
    var description = _controllerDescription.text;
    if (name.isNotEmpty && country.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      await programController
          .updateProgramController(
              Program(name: name, country: country, description: description),
              programId)
          .then((value) async {
        if (value == true) {
          showSnackbar(context, Colors.green, 'Program Updated successful');
          nextScreenReplace(context, const AllProgramScreen());
        } else {
          showSnackbar(context, Colors.red, 'Fail to Update new Program');
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
