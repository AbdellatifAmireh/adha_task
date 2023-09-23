// ignore_for_file: body_might_complete_normally_nullable

import 'package:adha_task/src/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (s) {
        if (!s!.isValidEmail()) {
          return "Enter a valid email";
        }
      },
      decoration: const InputDecoration(
        labelText: "Email field",
        helperText: "",
        hintText: "email@test.com",
      ),
    );
  }
}
