import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/pageview/homepage/home_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class product_item extends StatefulWidget {
  const product_item({super.key});

  void launchwhatsapp({required number, required message}) async {
    _launchURL() async {
      const url = 'https://en.wikipedia.org/wiki/Body_mass_index';
      if (await launch(url)) {
        await canLaunch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrlString(url)
        ? launchUrlString(url)
        : print("cannot open whatsapp");
  }

  @override
  State<product_item> createState() => _product_itemState();
}

class _product_itemState extends State<product_item> {
  @override
  Widget build(BuildContext context) {
    String? imagePath;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'product item',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const home_view(),
                ));
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              _launchURL() async {
                const url = 'https://en.wikipedia.org/wiki/Body_mass_index';
                if (await launchUrlString(url)) {
                  await canLaunchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
              }

              // widget.launchwhatsapp(message: "hello", number: "+966547402951");
              // var whatsappUrl = "https://wa.me/1XXXXXXXXXX";
              // await canLaunchUrlString(
              //   whatsappUrl,
              // )
              //     ? launchUrlString(whatsappUrl)
              //     : '';
            },
            icon: const Icon(Icons.share, size: 25)),
        backgroundColor: const Color.fromARGB(255, 63, 122, 168),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                    radius: 120,
                    backgroundImage: (imagePath != null)
                        ? FileImage(File(imagePath)) as ImageProvider
                        : const AssetImage('assets/d7.jpg')),
              ),
              // Text.rich(TextSpan(
              //   children: [
              //     TextSpan(
              //       text: 'مرحبا، ',
              //       style: getbodyStyle(fontSize: 18),
              //     ),
              //     TextSpan(
              //       text: user?.displayName,
              //       style: getTitleStyle(),
              //     )
              //   ],
              // )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      const Divider(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              '300pd',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              't-shirt',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Text(
                          'Within t andsuch as product brand, product title, andWithin th product title, and product title, ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          maxLines: 10,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
              //         child: GestureDetector(
              //           onTap: () {},
              //           child: Container(
              //             // height: 55,
              //             width: double.infinity,
              //             height: 70,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: Colors.red),
              //             child: Center(
              //               child: TextButton(
              //                 onPressed: () {},
              //                 child: const Text(
              //                   'addproduct to favourite',
              //                   style: TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white),
              //                   textAlign: TextAlign.center,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ]),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            // height: 55,
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 63, 122, 168),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'addproduct to cart',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
