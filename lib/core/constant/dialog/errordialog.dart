import 'package:flutter/material.dart';

showerrordialog(BuildContext context, error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: Text(error))),
  );
}
