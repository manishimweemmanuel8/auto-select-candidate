import 'package:auto_select_candidate/app/features/account/controller/user_controller.dart';
import 'package:auto_select_candidate/app/features/account/repository/user_repository.dart';
import 'package:auto_select_candidate/app/features/account/screen/Login/login_screen.dart';
import 'package:auto_select_candidate/components/widget.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String _userName='';
  String _role='';

    @override
  void initState() {
    super.initState();
    getUserLoggedInUser();
  }

   getUserLoggedInUser() async {
    await HelperFunctions.getUserNameFromSF().then((value) {
      if (value != null) {
        setState(() {
          _userName = value;
        });
      }
    });

    await HelperFunctions.getUserRoleFromSF().then((value) {
      if (value != null) {
        setState(() {
          _role = value;
        });
      }
    });
    }

    var userController=UserController(UserRepository());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _userName,
              style:const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text( _role,style:const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: primaryColor),),
          ],
        ),
        const SizedBox(
          width: defaultPadding * 3,
        ),
           IconButton(onPressed: () {
                    userController.signoutController();
                    nextScreenReplace(context, const LoginScreen());
                  }, icon: const Icon(Icons.logout_outlined,color: primaryColor,))
      ],
    );
  }
}
