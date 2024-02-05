import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/pageview/homepage/home_view.dart';
import 'package:flutter_application_1/core/service/app_local_stotage.dart';
import 'package:image_picker/image_picker.dart';

String? _imagePath;
String name = '';

class uploud extends StatefulWidget {
  const uploud({super.key});

  @override
  State<uploud> createState() => _uploudState();
}

class _uploudState extends State<uploud> {
  @override
  // void initState() {
  //   super.initState();
  //   AppLocal.getChached(AppLocal.imageKey).then((value) {
  //     setState(() {
  //       _imagePath = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 75,
        backgroundColor: const Color.fromARGB(255, 63, 122, 168),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  AppLocal.cacheBool(AppLocal.isUpload, true);
                  AppLocal.cacheData(AppLocal.nameKey, name);
                  if (_imagePath != null && name.isNotEmpty) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const home_view(),
                    ));
                  } else if (_imagePath == null && name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('upload image and text')));
                  } else if (_imagePath != null && name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('enter your text')));
                  } else if (_imagePath == null && name.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('upload your image')));
                  }
                },
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                  radius: 70,
                  backgroundImage: (_imagePath != null)
                      ? FileImage(File(_imagePath!)) as ImageProvider
                      : const AssetImage('assets/d7.jpg')),
              const Divider(),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 63, 122, 168),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Uploud from Gallery',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 63, 122, 168),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Uploud from Camera',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Divider(
                  height: 4,
                  color: Color.fromARGB(255, 63, 122, 168),
                ),
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    name = value;
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 63, 122, 168),
                      hintText: 'enter your name',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
            ]),
          ),
        ),
      ),
    );
  }

  getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }
}
