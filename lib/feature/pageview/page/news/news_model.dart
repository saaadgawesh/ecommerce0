import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/controlpages/products_view.dart';

class news_model {
  final String imgLink;
  final String productsname;
  final String price;

  news_model(
      {required this.imgLink, required this.productsname, required this.price});
}

//user page
class username_model {
  final String firstname;
  final String secondname;
  final String phone;
  final String email;
  final String address;

  username_model(
      {required this.firstname,
      required this.secondname,
      required this.phone,
      required this.email,
      required this.address});
}

//appcolor model
class AppColors {
  static Color sacffoldBG = const Color(0xff13140D);
  static Color containerBG = const Color(0xff30312D);
  static Color lomanda = const Color(0xffBEDE61);
  static Color grey = const Color(0xff928A8A);
  static Color white = Colors.white;
}

//FIREBASE FIRESTORE data
class categories {
  final String name;
  final String price;
  final String desc;
  final String image;
  final String category;
  final String amount;

  categories(
      {required this.name,
      required this.price,
      required this.desc,
      required this.image,
      required this.category,
      required this.amount});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'desc': desc,
      'image': image,
      'category': category,
      'amount': amount,
    };
  }
}

class fbfirestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addproductitem(context, {required categories}) async {
    _firebaseFirestore.collection("data").add(categories.toMap()).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(
            builder: (context) => const products_view(),
          ))
          .catchError((error) => print('pls add products'));
    });
  }
}
