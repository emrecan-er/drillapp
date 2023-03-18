import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deprem/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String currentUserUid;
  late String currentUserName;

  Future<User?> signIn(
    String email,
    String password,
  ) async {
    log('allah allah' + _authController.loggedInUserUid.value);

    var user = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      var errorCode = error;
      Get.snackbar('Error', 'Wrong username or password',
          icon: Icon(Icons.close));
    });
    currentUserUid = user.user!.uid;
    _authController.loggedInUserUid.value = currentUserName;

    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(
    String email,
    String password,
    String name,
    String surname,
    String age,
    String address,
    bool terms,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore
        .collection("user")
        .doc(user.user?.uid)
        .collection("info")
        .doc(user.user!.uid)
        .set({
      'name': name,
      'surname': surname,
      'age': age,
      'address': address,
      'password': password,
      'email': email,
      'terms': terms,
      'uid': user.user?.uid,
    });

    return user.user;
  }

  Stream<QuerySnapshot> getUser(String selectedUid) {
    var currentUser = _auth.currentUser!.uid;
    var ref = _firestore
        .collection("user")
        .doc(currentUser)
        .collection("info")
        .snapshots();

    return ref;
  }
}
