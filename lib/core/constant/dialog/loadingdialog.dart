import 'package:flutter/material.dart';

showloadingdialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [Lottie.asset('d1.json')],
            children: [CircularProgressIndicator()],
          ),
        );
      });
}
