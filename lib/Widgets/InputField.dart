import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.labelText, this.controller, this.obscureText = false, this.allow});
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? allow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        maxLines: 1,
        maxLength: 12,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("^[a-z0-9A-Z]+"), allow:allow??true),
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
          labelText: labelText,
      ),
    ),);
  }
}