import 'dart:convert';

import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;

class ScholorshipRepository implements Repository {
  @override
  Future<List<Scholorship>> getScholorshipList() async {
    List<Scholorship> scholorshipList = [];
    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/scholorship');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var body = json.decode(response.body);
    print(url);

    //perse

    for (var i = 0; i < body.length; i++) {
      scholorshipList.add(Scholorship.fromJson(body[i]));
    }

    return scholorshipList;
  }

  @override
  Future<bool> createScholorship(Scholorship scholorship) async {
    Map data = {
      'names': scholorship.names,
      'description': scholorship.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();
    // print(token);

    var url = Uri.parse('$apiUrl/scholorship');
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
  Future<bool> updateScholorship(
      Scholorship scholorship, String scholorshipId) async {
    Map data = {
      'names': scholorship.names,
      'description': scholorship.description,
    };

    String? token = await HelperFunctions.getUserAccessTokenFromSF();

    var url = Uri.parse('$apiUrl/scholorship/$scholorshipId');
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
  Future<Scholorship> getScholorship(String scholorshipId) async {
    var url = Uri.parse('$apiUrl/scholorship/$scholorshipId');
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
      return Scholorship.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Program');
    }
  }

  @override
  Future<List<Scholorship>> getRecentScholorshipList() async {
    List<Scholorship> scholorShipList = [];
    var url = Uri.parse('$apiUrl/scholorship/latest');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      scholorShipList.add(Scholorship.fromJson(body[i]));
    }
    return scholorShipList;
  }

  @override
  Future<List<Scholorship>> getLastScholorshipList() async {
    List<Scholorship> scholorShipList = [];
    var url = Uri.parse('$apiUrl/scholorship/last');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      scholorShipList.add(Scholorship.fromJson(body[i]));
    }
    return scholorShipList;
  }
}
