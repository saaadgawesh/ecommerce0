import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/onboarding/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const onboarding_view()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Lottie.asset('assets/d1.json')],
          ),
        ),
      ),
    );
  }
}
