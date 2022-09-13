// import 'package:auto_select_candidate/Screens/Welcome/welcome_screen.dart';
// import 'package:auto_select_candidate/Screens/forgot_password.dart/forgot_password_screen.dart';
// import 'package:auto_select_candidate/Screens/user/components/role_data.dart';
// import 'package:auto_select_candidate/components/forgot_password_check.dart';
// import 'package:auto_select_candidate/components/widget.dart';
// import 'package:auto_select_candidate/constants.dart';
// import 'package:auto_select_candidate/helper/helper_functions.dart';
// import 'package:auto_select_candidate/service/auth_service.dart';
// import 'package:flutter/material.dart';

// class UserForm extends StatefulWidget {
//   const UserForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<UserForm> createState() => _UserFormState();
// }

// class _UserFormState extends State<UserForm> {

//   List<String> roles=['ADMIN','STAFF'];
//   String role='STAFF';
//   final formKey= GlobalKey<FormState>();
//   String email='';
//   String password='';
//   String fullName='';
//   bool _isLoading=false;
//   // AuthService authService=AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//            key: formKey,

//       child:_isLoading? const Center(
//         child: CircularProgressIndicator(color: primaryColor),
//         )
//         : Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.text,
//             textInputAction: TextInputAction.next,
//             cursorColor: primaryColor,
//             onSaved: (names) {},
//             decoration: const InputDecoration(
//               hintText: "Names",
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.person),
//               ),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 fullName=value;
//               });
              
//             },
//             validator: (value) {
//               if(value!.isNotEmpty){

//                 return null;

//               }else{

//                 return 'Names cannot be empty';
//               }
//             },
//           ),
//           const SizedBox(height: defaultPadding),
       
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             cursorColor: primaryColor,
//             onSaved: (email) {},
//             decoration: const InputDecoration(
//               hintText: "Email",
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.text_fields),
//               ),
//             ),
//               onChanged: (value) {
//                           setState(() {
//                             email = value;
//                           });
//                         },

//                         // check tha validation
//               validator: (value) {
//                   return RegExp(
//                                       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                   .hasMatch(value!)
//                               ? null
//                               : "Please enter a valid email";
//                         },
//           ),
//                     const SizedBox(height: defaultPadding),

//            Padding(
//             padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//             child: TextFormField(
//               textInputAction: TextInputAction.done,
//               obscureText: true,
//               cursorColor: primaryColor,
//               decoration: const InputDecoration(
//                 hintText: "Your password",
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.all(defaultPadding),
//                   child: Icon(Icons.lock),
//                 ),
//               ),

//                onChanged: (value) {
//                           setState(() {
//                             password = value;
//                           });
//                         },
//                         validator: (value) {
//                           if (value!.length < 6) {
//                             return "Password must be at least 6 characters";
//                           } else {
//                             return null;
//                           }
//                         },
//             ),
//           ),
//           const SizedBox(height: defaultPadding),
        

//           DropdownButtonFormField<String>(
//              decoration: const InputDecoration(
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.text_fields),
//               ),
//             ),
//             value: role,
//             items: roles
//             .map((item) => DropdownMenuItem<String>(
//               value: item,
//               child: Text(item)
//               ),).toList(), onChanged: (value) {
//             setState(() {
//               role=value!;
//               print(value);
//             });
//           },),



//           const SizedBox(height: defaultPadding),
//           ElevatedButton(
//             onPressed: () {
             
//               register();
//             },
//             child: Text(
//               "Submit".toUpperCase(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   register() async {

//     // if (formKey.currentState!.validate()) {
//     //       print(fullName + role +email + password);

//     //   setState(() {
//     //     _isLoading = true;
//     //   });

//     //   await authService
//     //       .registerUserWithEmailandPassword(fullName,role, email, password)
//     //       .then((value) async {
//     //     if (value == true) {
//     //       // saving the shared preference state

//     //       await HelperFunctions.saveUserLoggedInStatus(true);
//     //       await HelperFunctions.saveUserEmailSF(email);
//     //       await HelperFunctions.saveUserNameSF(fullName);
//     //       nextScreenReplace(context, const WelcomeScreen());
//     //     } else {
//     //       showSnackbar(context, Colors.red, value);
//     //       setState(() {
//     //         _isLoading = false;
//     //       });
//     //     }
//     //   });
//     // }
//   }
// }
