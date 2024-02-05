import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth_model/auth_states.dart';
import 'package:flutter_application_1/core/constant/dialog/errordialog.dart';
import 'package:flutter_application_1/core/constant/dialog/loadingdialog.dart';
import 'package:flutter_application_1/feature/authentication/userAuth/usersignup.dart';
import 'package:flutter_application_1/feature/controlpages/controlpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class userlogin extends StatefulWidget {
  const userlogin({super.key});

  @override
  State<userlogin> createState() => _userloginState();
}

class _userloginState extends State<userlogin> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailfocusnode = FocusNode();
    final passwordfocusnode = FocusNode();
    @override
    void dispose() {
      _password.dispose();
      _email.dispose();

      // TODO: implement dispose
      super.dispose();
    }

    final size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthSuccessStates) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const controlpage(),
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
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 63, 122, 168),
            title: const Text(
              'التسجيل كمستخدم',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(passwordfocusnode),
                            focusNode: emailfocusnode,
                            controller: _email,
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'password must be not empty!';
                              }
                              return null;
                            },
                            cursorHeight: 20,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(),
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            focusNode: passwordfocusnode,
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'password must be not empty!';
                              }
                              return null;
                            },
                            controller: _password,
                            cursorHeight: 10,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          child: const Text('? forget your password'),
                          onTap: () {},
                        ),
                        const Divider(),
                        Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  context.read<AuthCubit>().loginuser_cubit(
                                      email: _email.text,
                                      password: _password.text);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 63, 122, 168),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                    // textAlign: TextAlign.center,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Center(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const usersignup(),
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    // height: 55,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 63, 122, 168),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'create account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                ),
                              ),
                              const Text(
                                'if you dont any account',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
