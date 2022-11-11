import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed; // Good
  const Button({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 51, 45, 45))),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
