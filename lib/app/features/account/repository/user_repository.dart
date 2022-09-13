import 'dart:convert';

import 'package:auto_select_candidate/app/features/account/model/auth/login_response.dart';
import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/account/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class UserRepository implements Repository {
  @override
  Future<List<User>> getUserList() async {
    List<User> userList = [];
    var url = Uri.parse('$apiUrl/auth');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      userList.add(User.fromJson(body[i]));
    }
    return userList;
  }

  @override
  Future<String> patchStatus(User user) async {
    var url = Uri.parse('$apiUrl/auth/${user.id}');
    // call back data
    String resData = '';
    // bool? -> string

    await http.patch(url, body: {
      'isActive': (!user.isActive!).toString(),
    }, headers: {
      'Authorization': 'your_token'
    }).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['isActive'];
    });
    return resData;
  }

  @override
  Future<bool> loginRepository(User user) async {
    Map data = {'username': user.username, 'password': user.password};

    var url = Uri.parse('$apiUrl/auth/signin');
    var response = false;
    try {
      var responseBody = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (responseBody.statusCode == 201) {
        LoginResponse loginResponse =
            LoginResponse.fromJson(json.decode(responseBody.body));

        Map<String, dynamic> payload = Jwt.parseJwt(loginResponse.accessToken);
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserTokenSF(loginResponse.accessToken);
        await HelperFunctions.saveUserEmailSF(payload['email']);
        await HelperFunctions.saveUserNameSF(payload['username']);
        await HelperFunctions.saveUserRoleSF(payload['role']);
        response = true;
      }
    } catch (e) {
      response = false;
    }
    return response;
  }

  @override
  Future<void> signoutRepository() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await HelperFunctions.saveUserRoleSF("");
      await HelperFunctions.saveUserTokenSF("");
    } catch (e) {
      return null;
    }
  }

  @override
  Future<int> countUser() async {
    var url = Uri.parse('$apiUrl/auth/countUser');

    int response = 0;

    try {
      var responseBody = await http.get(url);
      if (responseBody.statusCode == 200) {
        response = responseBody.body as int;
      }
    } catch (e) {}

    return response;
  }

  @override
  Future<bool> createUser(User user) async {
    Map data = {
      'username': user.username,
      'email': user.email,
      'password': user.password,
      'role': user.role
    };

    var url = Uri.parse('$apiUrl/auth/signup');
    var response = false;
    try {
      await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      response = true;
    } catch (e) {
      response = false;
    }
    return response;
  }

  @override
  Future<bool> deleteUser(String id) async {
    var url = Uri.parse('$apiUrl/auth/$id');

    bool response = false;

    try {
      var responseBody = await http.delete(url);

      if (responseBody.statusCode == 200) {
        response = true;
      }
    } catch (e) {
      response = false;
    }

    return response;
  }
}
