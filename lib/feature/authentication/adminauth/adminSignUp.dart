import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/authentication/adminauth/adminLogin.dart';
import 'package:flutter_application_1/feature/auth_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth_model/auth_states.dart';
import 'package:flutter_application_1/core/constant/dialog/errordialog.dart';
import 'package:flutter_application_1/core/constant/dialog/loadingdialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class adminSignUp extends StatefulWidget {
  const adminSignUp({super.key});

  @override
  State<adminSignUp> createState() => _adminSignUpState();
}

class _adminSignUpState extends State<adminSignUp> {
  late FirebaseFirestore _Firestore;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Firestore = FirebaseFirestore.instance;
  }

  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _secondnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isvisible = true;

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    _firstnamecontroller.dispose();
    _secondnamecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccessStates) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const adminLogin(),
              ),
              (route) => false);
        } else if (state is AuthErrorStates) {
          Navigator.of(context).pop();
          showerrordialog(context, state.error);
        } else {
          showloadingdialog(context);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'sign up',
                        style: TextStyle(fontSize: 50),
                      ),
                      const Divider(
                        height: 120,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pls enter your first name';
                            }
                            return null;
                          },
                          controller: _firstnamecontroller,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              labelText: 'enter your name'),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pls enter your last name';
                            }
                            return null;
                          },
                          controller: _secondnamecontroller,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              labelText: 'enter your last name'),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pls enter your email';
                            }

                            return null;
                          },
                          controller: _emailcontroller,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              labelText: 'enter your email',
                              hintStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'password must be contain 8 character';
                            }
                            return null;
                          },
                          controller: _passwordcontroller,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              labelText: 'enter your password'),
                        ),
                      ),
                      const Divider(),
                      Container(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthCubit>().registerAdmin_cubit(
                                    name: _emailcontroller.text,
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                // height: 55,
                                width: 120,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 63, 122, 168),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text(
                                  'sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
