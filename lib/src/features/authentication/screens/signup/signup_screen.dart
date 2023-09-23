import 'package:adha_task/src/constants/sizes.dart';
import 'package:adha_task/src/constants/text_strings.dart';
import 'package:adha_task/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import 'widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: BackButton(),
        title: Text("Signup Page",
            style: Theme.of(context).textTheme.displaySmall),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                tSignup,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SignupForm(),
              TextButton(
                onPressed: () => Get.off(() => const LoginScreen()),
                child: Text.rich(TextSpan(
                  text: tAlreadyHaveAccount,
                  children: [
                    TextSpan(
                      text: tLogin.toUpperCase(),
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
