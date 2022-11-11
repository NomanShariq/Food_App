import 'package:flutter/material.dart';

class PassTextFormField extends StatefulWidget {
  final TextEditingController passcontroller;
  final String passtitle;
  final String hintText;
  const PassTextFormField(
      {super.key,
      required this.passcontroller,
      required this.passtitle,
      required this.hintText,});

  @override
  State<PassTextFormField> createState() => _PassTextFormFieldState();
}

class _PassTextFormFieldState extends State<PassTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passcontroller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: widget.passtitle,
        hintText: widget.passtitle,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
