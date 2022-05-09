import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final bool isSuffix;
  final String helper;
  const FormInput(
      {Key? key,
      this.labelText = '',
      this.isPassword = false,
      this.isSuffix = false,
      this.helper = "",
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        contentPadding: const EdgeInsets.all(10),
        hintText: labelText,
        helperText: helper,
      ),
    );
  }
}
