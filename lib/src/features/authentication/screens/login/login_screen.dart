import 'package:adha_task/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../signup/signup_screen.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: BackButton(),
        title:
            Text("Login Page", style: Theme.of(context).textTheme.displaySmall),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                tLogin,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              LoginForm(),
              TextButton(
                //onPressed: () => Get.to(() => const SignupScreen()),
                onPressed: () => Get.off(() => const SignupScreen()),
                child: Text.rich(TextSpan(
                  text: tDonotHaveAccount,
                  children: [
                    TextSpan(
                      text: tSignup.toUpperCase(),
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
