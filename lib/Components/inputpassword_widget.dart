import 'package:flutter/material.dart';

class AuthPassword extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final bool isSuffix;
  final String helper;
  const AuthPassword(
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
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
          hintText: labelText,
          helperText: helper,
          suffixIcon: isSuffix
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility)),
    );
  }
}
