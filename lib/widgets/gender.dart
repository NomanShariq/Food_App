import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  final bool gender;
  final VoidCallback onTap;
  const GenderSelect({super.key, required this.gender, required this.onTap});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Text(widget.gender == true ? "Female" : "Male"),
      ),
    );
  }
}
