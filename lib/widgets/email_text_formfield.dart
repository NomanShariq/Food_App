import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String emailText;
  final String hintText;
  const EmailTextFormField(
      {super.key,
      required this.controller,
      required this.emailText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: emailText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
      ),
    );
  }
}
