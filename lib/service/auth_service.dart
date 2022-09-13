// import 'dart:convert';

// import 'package:auto_select_candidate/constants.dart';
// import 'package:auto_select_candidate/helper/helper_functions.dart';
// import 'package:auto_select_candidate/model/auth/login_request.dart';
// import 'package:auto_select_candidate/model/auth/login_response.dart';
// import 'package:auto_select_candidate/model/auth/user.dart';
// import 'package:http/http.dart' as http;
// import 'package:jwt_decode/jwt_decode.dart';


// class AuthService {

//    Future login(LoginRequest user) async {
//     Map data = {
//       'username': user.userName,
//       'password': user.password
//     };

//     final response = await http.post(
//       Uri.parse('$apiUrl/auth/signin'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(data),
//     );
//            LoginResponse loginResponse=LoginResponse.fromJson(json.decode(response.body));
//            print(loginResponse);

//     if (response.statusCode == 201) {


//       Map<String, dynamic> payload = Jwt.parseJwt(loginResponse.accessToken!);
//       // Users data=payload as Users;
//             await HelperFunctions.saveUserLoggedInStatus(true);

//       await HelperFunctions.saveUserTokenSF(loginResponse.accessToken!);
         
//           await HelperFunctions.saveUserEmailSF(payload['email']);
//           await HelperFunctions.saveUserNameSF(payload['username']);
//           await HelperFunctions.saveUserRoleSF(payload['role']);


//       return true;
//     } else {
 
//             return false;

//     }
//   }

//   //get all user






//   // Future getUsers() async {
//   //    final response = await http.get( Uri.parse('$apiUrl/auth'));

//   //   if (response.statusCode == 200) {
//   //       return Users.fromJson(json.decode(response.body));  

//   //   } else {
//   //     throw "Failed to load users list";
//   //   }
//   // }

//   // signout

//   Future signOut() async {
//     try {
//       await HelperFunctions.saveUserLoggedInStatus(false);
//       await HelperFunctions.saveUserEmailSF("");
//       await HelperFunctions.saveUserNameSF("");
//       await HelperFunctions.saveUserRoleSF("");
//       await HelperFunctions.saveUserTokenSF("");
//     } catch (e) {
//       return null;
//     }
//   }
// }


