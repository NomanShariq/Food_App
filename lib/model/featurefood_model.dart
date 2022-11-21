import 'package:flutter/material.dart';

class FeatureFoodModel {
 final String name, image, subtitle;
 final String price, ratings;
  FeatureFoodModel(
      {required this.name,
      required this.image,
      required this.subtitle,
      required this.ratings,
      required this.price});
}
