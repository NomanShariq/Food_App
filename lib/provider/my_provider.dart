import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfood_app/model/category_model.dart';
import 'package:myfood_app/model/featurefood_model.dart';

class MyProvider with ChangeNotifier {
  // Category Products list data

  static List<CategoryModel> categoryModelList = [];
  late CategoryModel categoryModel;

  Future<void> getCategoryProduct() async {
    List<CategoryModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("HomeCategory").get();
    querySnapshot.docs.forEach(
      (categorydata) {
        categoryModel = CategoryModel(
          image: categorydata["Image"],
          name: categorydata["name"],
        );
        list.add(categoryModel);
      },
    );
    categoryModelList = list;
    notifyListeners();
  }

  List<CategoryModel> get getCategoryModelList {
    return categoryModelList;
  }

  // Feature Products list data

  static List<FeatureFoodModel> featureModelList = [];
  late FeatureFoodModel featurefoodModel;

  Future<void> getFeatureFood() async {
    List<FeatureFoodModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("HomeFeatureFood").get();
    querySnapshot.docs.forEach(
      (featurefooddata) {
        featurefoodModel = FeatureFoodModel(
          image: featurefooddata["image"],
          name: featurefooddata["name"],
          price: featurefooddata['price'].toString(),
          ratings: featurefooddata['rating'].toString(),
          subtitle: featurefooddata['subtitle'],
        );
        list.add(featurefoodModel);
      },
    );
    featureModelList = list;
    notifyListeners();
  }

  List<FeatureFoodModel> get getFeatureFoodModelList {
    return featureModelList;
  }
}
