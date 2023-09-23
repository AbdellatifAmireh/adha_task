import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String> validator;
  final String labelText;
  final String? currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  const PasswordField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    required this.currentValue,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (s) {
      //   if (s!.isWhitespace()) {
      //     return "This is a required field";
      //   }
      // },
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),

      initialValue: widget.currentValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: "Password field",
        helperText: "",
        hintText: "Password",
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
