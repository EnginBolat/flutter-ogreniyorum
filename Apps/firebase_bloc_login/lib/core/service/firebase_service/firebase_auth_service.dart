import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User>? signInWithTwitter(){
    return null;
  }

  Future<User?> createPerson(
    String name,
    String surname,
    String phoneNumber,
    String email,
    String password,
    BuildContext context,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({
          'name': name,
          'surname': surname,
          'phone': phoneNumber,
          'email': email,
          'password': password,
        })
        .then((value) {})
        .catchError((e) {
          if (kDebugMode) print(e);
        });
    return user.user;
  }
}
