import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  // final TextEditingController controller;
  String type;
  String value;
  final String hintText;
  bool obscureTextValue;
  void Function(String?) onSaved;
  String? Function(String?)? validator;
  TextFieldCustom(
      {super.key,
      // required this.controller,
      required this.type,
      required this.hintText,
      required this.value,
      this.obscureTextValue = false,
      required this.onSaved,
      required this.validator
      });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: widget.hintText,
            hintText: widget.hintText,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            // filled: true,
            //hintStyle: TextStyle(color: Colors.grey[800]),
            //fillColor: Colors.white70,
          ),
          autocorrect: false,
          obscureText: widget.type == 'pass' ? true : false,
          // validator: (val) {
          //   if (widget.value == "email") {
          //     if (val == null || val.trim().isEmpty || !val.contains('@')) {
          //       return 'Please enter a valid email';
          //     }
          //   } else if (widget.value == "pass") {
          //     if (val == null || val.trim().length < 4) {
          //       return 'Please enter a valid Password';
          //     }
          //   } else {
          //     return "";
          //   }
          // },
          validator: widget.validator,
          onSaved: widget.onSaved,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
