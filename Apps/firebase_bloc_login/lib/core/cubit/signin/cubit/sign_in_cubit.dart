import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../view/otp_page.dart';
import '../../../service/firebase_service/firebase_auth_service.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService authService = AuthService();

  Future<void> verifyPhoneNumberCubit(
    String name,
    String surname,
    String phone,
    String email,
    String password,
    BuildContext context,
  ) async {
    emit(SignInLoading());
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) async {
        if (e.code == 'invalid-phone-number') {
          if (kDebugMode) {
            print('The provided phone number is not valid.');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Kayıt Hatası",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ));
          if (kDebugMode) print("Error Code : ${e.code}");
          if (kDebugMode) {
            print("Error Message : ${e.message}");
          }
        }
      },
      codeSent: (String verificationId, int? requestToken) async {
        Future.delayed(const Duration(seconds: 10));
        authService
            .createPerson(name, surname, phone, email, password, context)
            .whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpPage(
                email: email,
                password: password,
                phoneNumber: phone,
                countryCode: "90",
                verificationId: verificationId,
              ),
            ),
          );
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
