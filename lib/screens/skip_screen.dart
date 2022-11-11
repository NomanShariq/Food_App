import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfood_app/screens/login_page.dart';
import 'package:myfood_app/widgets/button.dart';

class SkipScreen extends StatelessWidget {
  const SkipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Carousel(
              animationDuration: const Duration(seconds: 2),
              dotIncreasedColor: Colors.black,
              boxFit: BoxFit.cover,
              autoplay: true,
              dotBgColor: Colors.transparent,
              images: const [
                AssetImage("images/imageslider1.jpg"),
                AssetImage("images/imageslider2.jpg"),
                AssetImage("images/imageslider3.jpg"),
              ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Button(
                name: "SkipScreen",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const LoginPage())));
                }),
          ),
        ),
      ],
    );
  }
}
