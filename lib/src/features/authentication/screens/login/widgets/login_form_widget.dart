import 'package:adha_task/src/features/core/screens/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/form/form_validation.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail),
              autocorrect: false,
              validator: (val) => validateEmail(val),
            ),
            SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                ),
                labelText: tPass,
                hintText: tPass,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                  ),
                ),
              ),
              validator: (val) => validatePass(val),
              autocorrect: false,
              obscureText: _obscureText,
            ),
            SizedBox(height: tFormHeight),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(tForgetPass),
              ),
            ),
            ElevatedButton(
              //onPressed: () => Get.to(() => DashboardScreen()),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LoginController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
              child: Text(tLogin.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
