import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
