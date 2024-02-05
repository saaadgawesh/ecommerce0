import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/feature/auth_model/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialStates());

  registerAdmin_cubit(
      {required String name,
      required String email,
      required String password}) async {
    emit(AuthLoadingStates());
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      print(user.email);
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('admin').doc(user.uid).set({
        'password': password,
        'email': email,
      }, SetOptions(merge: true));
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-used') {
        emit(AuthErrorStates(error: 'يوجد حساب بالفعل في هذا الايميل'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorStates(error: 'كلمة السر التي ادخلتها ضعيفه'));
      } else {
        print(e.toString());
        emit(AuthErrorStates(error: e.toString()));
      }
    }
  }

  loginadmin_cubit({required email, required password}) async {
    emit(AuthLoadingStates());
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      // await user.updateDisplayName(uid);
      FirebaseFirestore.instance.collection('admin').doc(user.uid).set(
          {'image': null, 'email': email, 'password': password},
          SetOptions(merge: true));
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-used') {
        emit(AuthErrorStates(error: 'يوجد حساب بالفعل في هذا الايميل'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorStates(error: 'كلمة السر التي ادخلتها ضعيفه'));
      } else {
        emit(AuthErrorStates(error: e.toString()));
      }
    }
  }

  registeruser_cubit({
    required name,
    required String email,
    required String password,
    required String firstname,
    required String secondname,
  }) async {
    emit(AuthLoadingStates());
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        "name": name,
        "email": email,
        "password": null,
        "firstname": firstname,
        "secondname": secondname
      }, SetOptions(merge: true));
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-used') {
        emit(AuthErrorStates(error: 'يوجد حساب بالفعل في هذا الايميل'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorStates(error: 'كلمة السر التي ادخلتها ضعيفه'));
      } else {
        emit(AuthErrorStates(error: e.toString()));
      }
    }
  }

  loginuser_cubit({required email, required String password}) async {
    emit(AuthLoadingStates());
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      // await user.updateDisplayName(name);
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'email': email, 'password': password}, SetOptions(merge: true));
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-used') {
        emit(AuthErrorStates(error: 'يوجد حساب بالفعل في هذا الايميل'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorStates(error: 'كلمة السر التي ادخلتها ضعيفه'));
      } else {
        emit(AuthErrorStates(error: e.toString()));
      }
    }
  }

  addproducts_cubit(
      {required name,
      required String image,
      required String password,
      required String price,
      required String Amount,
      required String email,
      required String typeofdepartment,
      required String description}) async {
    emit(AuthLoadingStates());
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('data').doc(user.uid).set({
        'nameofproduct': name,
        'priceofproduct': price,
        'password': null,
        'descrip': description,
        'amountofproduct': Amount,
        'typeofdepartment': typeofdepartment,
        'image': image,
      }, SetOptions(merge: true));
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-used') {
        emit(AuthErrorStates(error: 'يوجد حساب بالفعل في هذا الايميل'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorStates(error: 'كلمة السر التي ادخلتها ضعيفه'));
      } else {
        emit(AuthErrorStates(error: e.toString()));
      }
    }
  }
}
