import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/controlpages/addproduct.dart';
import 'package:flutter_application_1/feature/controlpages/departments_view.dart';
import 'package:flutter_application_1/feature/controlpages/products_view.dart';
import 'package:flutter_application_1/feature/controlpages/requests_view.dart';
import 'package:flutter_application_1/feature/controlpages/users_view.dart';
import 'package:flutter_application_1/feature/pageview/homepage/home_view.dart';

class controlpage extends StatefulWidget {
  const controlpage({super.key});

  @override
  State<controlpage> createState() => _controlpageState();
}

class _controlpageState extends State<controlpage> {
  // void ontap(index) {
  //   if (index == 0) {
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => const addproduct(),
  //     ));
  //   }
  // }

  List<String> title = [
    'اضافة منتج',
    'المنتجات',
    'المستخدمين',
    'الطلبات',
    'الاقسام',
    ' الرئيسيه',
  ];
  final int _pageindex = 0;
  final controller = DragSelectGridViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 63, 122, 168),
          title: const Text(
            ' صفحة التحكم',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          elevation: 1,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (index == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const addproduct(),
                              ));
                            }
                            if (index == 1) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const products_view(),
                              ));
                            }
                            if (index == 2) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const users_view(),
                              ));
                            }
                            if (index == 3) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const requests_view(),
                              ));
                            }
                            if (index == 4) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const deparments_view(),
                              ));
                            }
                            if (index == 5) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const home_view(),
                              ));
                            }
                          },
                        );
                      },
                      child: Card(
                          color: const Color.fromARGB(255, 63, 122, 168),
                          elevation: 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 60),
                            child: Text(
                              title[index],
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )));
                })));
  }
}
