import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/app_local_stotage.dart';
import 'package:flutter_application_1/feature/pageview/page/news/news_model.dart';

String? _imagePath;
String? name = '';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
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
      body: GridView.builder(
          itemCount: products.length,
          primary: false,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 150,
              child: Column(
                children: [
                  FutureBuilder(
                    future: AppLocal.getChached(AppLocal.imageKey),
                    builder: (context, snapshot) {
                      return Image.asset(products[index].imgLink);
                    },
                  ),
                  FutureBuilder(
                    future: AppLocal.getChached(AppLocal.nameKey),
                    builder: (context, snapshot) {
                      return Text(products[index].productsname);
                    },
                  ),
                  FutureBuilder(
                    future: AppLocal.getChached(AppLocal.nameKey),
                    builder: (context, snapshot) {
                      return Text(products[index].price);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
