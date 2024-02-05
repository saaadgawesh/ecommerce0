import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/pageview/page/news/news_model.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final int _pageindex = 0;
  final controller = DragSelectGridViewController();
  List<news_model> products = [
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
    news_model(
        imgLink: 'assets/d7.jpg', productsname: 'productsname', price: 'price'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: products.length,
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
              childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Image.asset(products[index].imgLink),
                Text(products[index].productsname),
                Text(products[index].price)
              ],
            );
          }),
    );
  }
}
