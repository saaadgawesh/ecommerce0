import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/app_local_stotage.dart';

import 'package:flutter_application_1/core/constant/utils/app_text_styles.dart';

class profily extends StatelessWidget {
  const profily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profil',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 122, 168),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 70, right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.abc)),
                  const Divider(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('data',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
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
      ]),
    );
  }
}
