import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/pageview/homepage/home_view.dart';

class deparments_view extends StatefulWidget {
  const deparments_view({super.key});

  @override
  State<deparments_view> createState() => _deparments_viewState();
}

class _deparments_viewState extends State<deparments_view> {
  List<String> title = [
    'قسم الاكسسوارات',
    'قسم الحريمي',
    'قسم       الرجال',
    'قسم      الاطفال'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 63, 122, 168),
          title: const Text(
            'الاقسام',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (index == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const home_view(),
                              ));
                            }
                            if (index == 1) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const home_view(),
                              ));
                            }
                            if (index == 2) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const home_view(),
                              ));
                            }
                            if (index == 3) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const home_view(),
                              ));
                            }
                          },
                        );
                      },
                      child: Card(
                          color: const Color.fromARGB(255, 63, 122, 168),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                title[index],
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )));
                })));
  }
}
