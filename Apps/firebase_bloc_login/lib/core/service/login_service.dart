import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_service/firebase_auth_service.dart';

abstract class ILoginService {
  Future<User?> loginService(
      String email, String password, BuildContext context) async {
    return null;
  }

  Future<void> signInWithTwitter();
}

class LoginService implements ILoginService {
  final AuthService _authService = AuthService();

  @override
  Future<User?> loginService(email, password, context) async {
    try {
      User? user = await _authService.signIn(email, password);
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "E-Posta veya Şifre Hatalı",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ));
      return null;
    }
  }

  @override
  Future<void> signInWithTwitter() async {
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();

    if (kIsWeb) {
      await FirebaseAuth.instance.signInWithPopup(twitterProvider);
    } else {
      await FirebaseAuth.instance.signInWithProvider(twitterProvider);
    }
  }
}
