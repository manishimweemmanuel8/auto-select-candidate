import 'dart:convert';

import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';
import 'package:auto_select_candidate/app/features/criterial/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;

class CriterialRepository implements Repository {
  @override
  Future<List<Criterial>> getCriterialList(String scholorshipId) async {
    List<Criterial> criterialList = [];
    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/criterial/scholorship/$scholorshipId');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      criterialList.add(Criterial.fromJson(body[i]));
    }

    return criterialList;
  }

  @override
  Future<bool> createCriterial(Criterial criterial) async {
    print(criterial);
    Map data = {
      'marks_from': criterial.marksFrom,
      'marks_to': criterial.marksTo,
      'programId': criterial.programId,
      'combinationId': criterial.combinationId,
      'scholorshipId': criterial.scholorshipId,
    };
    print(jsonEncode(data));

    String? token = await HelperFunctions.getUserAccessTokenFromSF();
    print(token);

    var url = Uri.parse('$apiUrl/criterial');
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
  Future<bool> updateCriterial(Criterial criterial, String criterialId) async {
    Map data = {
      'marks_from': criterial.marksFrom,
      'marks_to': criterial.marksTo,
      'programId': criterial.programId,
      'combinationId': criterial.combinationId,
      'scholorshipId': criterial.scholorshipId,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/criterial/$criterialId');
    var response = false;

    try {
      var responseBody = await http.patch(url,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));

      print(jsonEncode(data));

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
  Future<Criterial> getCriterial(String criterialId) async {
    var url = Uri.parse('$apiUrl/criterial/$criterialId');
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
      return Criterial.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Criterial');
    }
  }

  @override
  Future<List<Criterial>> getTwoLatestCriterialList() async {
    List<Criterial> criterialList = [];
    var url = Uri.parse('$apiUrl/criterial/latest');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      criterialList.add(Criterial.fromJson(body[i]));
    }
    return criterialList;
  }
}
