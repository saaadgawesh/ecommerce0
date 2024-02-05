import 'dart:io';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/app_local_stotage.dart';
import 'package:flutter_application_1/feature/pageview/page/news/news_model.dart';
import 'package:flutter_application_1/core/constant/utils/app_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class news extends StatefulWidget {
  const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    UserID = user?.uid;
  }

  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://ecommerce-60608.appspot.com');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _imagePath;
  File? file;
  String? profileUrl;
  User? user;
  String? UserID;
  int _pageindex = 0;
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
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                future: AppLocal.getChached(AppLocal.nameKey),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: 'مرحبا، ',
                            style: getbodyStyle(fontSize: 18),
                          ),
                          TextSpan(
                            text: snapshot.data,
                            style: getTitleStyle(),
                          ),
                        ],
                      )),
                      const Text(
                        'Have anice time',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  );
                },
              ),
              const Spacer(),
              // FutureBuilder(
              //   future: AppLocal.getChached(AppLocal.imageKey),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return CircleAvatar(
              //         radius: 45,
              //         backgroundColor: Colors.white,
              //         child: CircleAvatar(
              //           radius: 45,
              //           backgroundImage: FileImage(File(snapshot.data!)),
              //         ),
              //       );
              //     } else {
              //       return CircleAvatar(
              //         radius: 45,
              //         backgroundColor: Colors.white,
              //         child: CircleAvatar(
              //           backgroundColor: AppColors.grey,
              //           radius: 45,
              //           backgroundImage: const AssetImage('assets/d10.jpg'),
              //         ),
              //       );
              //     }
              //   },
              // ),
            ],
          ),
        ),
        const Divider(),
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/d7.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            //         ),
            // },
          ),
          options: CarouselOptions(
            //   height: size.height * 0.6,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _pageindex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
            controller: PageController(initialPage: _pageindex),
            count: 5,
            effect: const SwapEffect(), // your preferred effect
            onDotClicked: (index) {}),
        const SizedBox(
          height: 10,
        ),
        ButtonsTabBar(
          radius: 14,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff0d47a1),
                Color(0xff1976d2),
                Color(0xff42a5f5)
              ],
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          height: 50,
          tabs: const [
            Tab(
              text: 'اكسسوارات',
            ),
            Tab(
              text: 'رجالي',
            ),
            Tab(
              text: 'نسائي',
            ),
            Tab(
              text: 'اطفالي',
            ),
          ],
        ),
        Expanded(
            child: TabBarView(
          children: [
            GridView.builder(
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
                      Row(
                        children: [
                          Text(products[index].productsname),
                          const Spacer(),
                          Text(products[index].price),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Color.fromARGB(255, 63, 122, 168),
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
            GridView.builder(
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
                      Row(
                        children: [
                          Text(products[index].productsname),
                          const Spacer(),
                          Text(products[index].price),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Color.fromARGB(255, 63, 122, 168),
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
            GridView.builder(
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
                      Row(
                        children: [
                          Text(products[index].productsname),
                          const Spacer(),
                          Text(products[index].price),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Color.fromARGB(255, 63, 122, 168),
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
            GridView.builder(
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
                      Row(
                        children: [
                          Text(products[index].productsname),
                          const Spacer(),
                          Text(products[index].price),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Color.fromARGB(255, 63, 122, 168),
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
          ],
        ))
      ]),
    );
  }
}
