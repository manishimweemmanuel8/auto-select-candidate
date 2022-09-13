import 'dart:convert';

import 'package:auto_select_candidate/app/features/select/model/select.dart';
import 'package:auto_select_candidate/app/features/select/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;

class SelectRepository implements Repository {
  @override
  Future<List<Select>> getSelectList(String scholorshipId) async {
    List<Select> selectList = [];
    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/select/scholorship/$scholorshipId');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var body = json.decode(response.body);

    // print(Select.fromJson(body));
    //perse

    for (var i = 0; i < body.length; i++) {
      selectList.add(Select.fromJson(body[i]));
      print(i);
    }

    return selectList;
  }

  @override
  Future<bool> createSelect(Select select) async {
    Map data = {
      'scholorshipId': select.scholorshipId,
      'emailMessage':select.emailMessage,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/Select');
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
  Future<bool> updateSelect(Select select, String selectId) async {
    Map data = {
      'interviewStatus': select.interviewStatus,
      'pass': select.pass,
      'candidateId': select.candidateId,
      'scholorshipId': select.scholorshipId,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/select/$selectId');
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
  Future<Select> getSelect(String selectId) async {
    var url = Uri.parse('$apiUrl/select/$selectId');
    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Select.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Select');
    }
  }
}
