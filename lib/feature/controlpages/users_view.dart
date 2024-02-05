import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class users_view extends StatefulWidget {
  const users_view({super.key});

  @override
  _users_viewState createState() => _users_viewState();
}

class _users_viewState extends State<users_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  'error',
                  style: TextStyle(color: Colors.red),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${snapshot.data!.docs[index].data()}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const Divider(
                                thickness: 3,
                                color: Colors.white,
                                indent: 1,
                                endIndent: 1,
                              )
                            ],
                          ),
                        ));
                  },
                );
              }
              return const Text('data not found');
            }));
  }
}
