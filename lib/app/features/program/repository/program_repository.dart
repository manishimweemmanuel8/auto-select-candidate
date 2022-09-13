import 'dart:convert';

import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;

class ProgramRepository implements Repository {
  @override
  Future<List<Program>> getProgramList() async {
    List<Program> programList = [];
    var url = Uri.parse('$apiUrl/program');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      programList.add(Program.fromJson(body[i]));
    }
    return programList;
  }

  @override
  Future<bool> createProgram(Program program) async {
    Map data = {
      'name': program.name,
      'country': program.country,
      'description': program.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();
    // print(token);

    var url = Uri.parse('$apiUrl/program');
    var response = false;
    try {
      var responseBody = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));

      if (responseBody.statusCode == 201) {
        response = true;
      } else {
        response = false;
      }
    } catch (e) {
      response = false;
    }
    return response;
  }

  @override
  Future<bool> updateProgram(Program program, String programId) async {
    Map data = {
      'name': program.name,
      'country': program.country,
      'description': program.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/program/$programId');
    var response = false;

    try {
      var responseBody = await http.patch(url,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));

      if (responseBody.statusCode == 200) {
        response = true;
      } else {
        response = false;
      }
    } catch (e) {
      response = false;
    }
    return response;
  }

  @override
  Future<Program> getProgram(String id) async {
    var url = Uri.parse('$apiUrl/program/$id');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var program = Program.fromJson(jsonDecode(response.body));
      return Program.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Program');
    }
  }

  @override
  Future<String?> getProgramName(String id) async {
    var url = Uri.parse('$apiUrl/program/$id');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var program = Program.fromJson(jsonDecode(response.body));
      return program.name;
    } else {
      throw Exception('Failed to load Program');
    }
  }

  @override
  Future<List<Program>> getLastTwoProgramList() async {
    List<Program> programList = [];
    var url = Uri.parse('$apiUrl/program/latest');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      programList.add(Program.fromJson(body[i]));
    }
    return programList;
  }
}
