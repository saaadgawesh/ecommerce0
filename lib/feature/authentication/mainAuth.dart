import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/authentication/adminauth/adminLogin.dart';
import 'package:flutter_application_1/feature/authentication/userAuth/userlogin.dart';

class mainAuth extends StatefulWidget {
  const mainAuth({super.key});

  @override
  State<mainAuth> createState() => _mainAuthState();
}

class _mainAuthState extends State<mainAuth> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 122, 168),
        title: const Text(
          'صفحه التسجيل الرئيسيه',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 1.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const userlogin(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 63, 122, 168),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          'التسجيل كمستخدم',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const adminLogin(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 63, 122, 168),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          'التسجيل  كمسؤل',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
