import 'package:adha_task/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/form/form_validation.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tFullname,
                  hintText: tFullname),
            ),
            SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: tEmail,
                  hintText: tEmail),
              validator: (val) => validateEmail(val),
              autocorrect: false,
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
            TextFormField(
              controller: controller.passwordConfirm,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                ),
                labelText: tPassConfirm,
                hintText: tPassConfirm,
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
              autocorrect: false,
              obscureText: _obscureText,
              validator: (val) =>
                  validatePassConfirm(val, controller.password.text.trim()),
            ),
            SizedBox(height: tFormHeight),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  SignupController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());

                  final user = UserModel(
                    email: controller.email.text.trim(),
                    fullname: controller.fullName.text.trim(),
                  );
                  SignupController.instance.createUser(user);
                }
              },
              child: Text(tSignup.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
