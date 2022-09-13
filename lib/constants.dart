import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF6F35A5);
const backgroundColor = Color(0xFFF1E6FF);
const blackColor = Colors.black;
const whiteColor = Colors.white;

const double defaultPadding = 16.0;
final String apiUrl = "http://localhost:3001/api/v1";

String token = getUserLoggedInToken();

getUserLoggedInToken() async {
  await HelperFunctions.getUserAccessTokenFromSF().then((value) {
    token = value!;
  });
}
