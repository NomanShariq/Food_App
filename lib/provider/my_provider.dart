import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfood_app/model/category_model.dart';

class MyProvider with ChangeNotifier {
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
}
