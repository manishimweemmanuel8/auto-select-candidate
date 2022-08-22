import 'package:auto_select_candidate/components/project_name.dart';
import 'package:flutter/material.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:auto_select_candidate/responsive.dart';
import '../../components/background.dart';
import 'components/forgot_password_screen_top_image.dart';
import 'components/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileForgotPasswordScreen(),
          desktop: Row(
            children: [
              const SizedBox(
                height: 700,
              ),
              const Expanded(
                child: ForgotPasswordScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ProjectName(),
                    SizedBox(
                      height: defaultPadding * 6,
                    ),
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileForgotPasswordScreen extends StatelessWidget {
  const MobileForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ForgotPasswordScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
