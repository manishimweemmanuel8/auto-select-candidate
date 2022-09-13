import 'dart:convert';

import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;

class CombinationRepository implements Repository {
  @override
  Future<List<Combination>> getCombinationList() async {
    List<Combination> combinationList = [];
    var url = Uri.parse('$apiUrl/combination');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      combinationList.add(Combination.fromJson(body[i]));
    }
    return combinationList;
  }

  @override
  Future<bool> createCombination(Combination combination) async {
    Map data = {
      'name': combination.name,
      'abbreviation': combination.abbreviation,
      'description': combination.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();
    // print(token);

    var url = Uri.parse('$apiUrl/combination');
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
  Future<bool> updateCombination(
      Combination combination, String combinationId) async {
    Map data = {
      'name': combination.name,
      'abbreviation': combination.abbreviation,
      'description': combination.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/combination/$combinationId');
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
  Future<Combination> getCombination(String combinationId) async {
    var url = Uri.parse('$apiUrl/combination/$combinationId');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Combination.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Program');
    }
  }

  @override
  Future<List<Combination>> getTwoLatestCombinationList() async {
    List<Combination> combinationList = [];
    var url = Uri.parse('$apiUrl/combination/latest');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      combinationList.add(Combination.fromJson(body[i]));
    }
    return combinationList;
  }
}
