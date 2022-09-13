import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
import 'package:auto_select_candidate/components/forgot_password_check.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (names) {},
            decoration: const InputDecoration(
              hintText: "Names",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLines: 4,
            cursorColor: primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Description",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.text_fields),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (names) {},
            decoration: const InputDecoration(
              hintText: "Program",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.text_fields),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (names) {},
            decoration: const InputDecoration(
              hintText: "Combination",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.text_fields),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const WelcomeScreen();
              //     },
              //   ),  
              // );
            },
            child: Text(
              "Submit".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
