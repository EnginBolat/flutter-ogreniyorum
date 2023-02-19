import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_login/constants/app_padding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../constants/app_text.dart';
import '../core/cubit/login/login_cubit.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.phoneNumber,
    required this.countryCode,
    required this.verificationId,
    required this.email,
    required this.password,
  });
  final String phoneNumber;
  final String countryCode;
  final String verificationId;
  final String email;
  final String password;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late TextEditingController pinputController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String otp = "";
  late String verificationId;

  @override
  void initState() {
    pinputController = TextEditingController();
    verificationId = widget.verificationId;
    super.initState();
  }

  @override
  void dispose() {
    pinputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(AppPadding.maxValue),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/img_message.png",
                    fit: BoxFit.fill,
                    height: deviceHeight * 0.4,
                    width: deviceWidth * 0.6,
                  ),
                  Text(
                    widget.countryCode + widget.phoneNumber,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppText.otpPageDesc,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Pinput(
                    length: 6,
                    controller: pinputController,
                    pinAnimationType: PinAnimationType.fade,
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    onSubmitted: (pin) async {
                      otp = pin;
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: otp,
                          );
                          await _auth
                              .signInWithCredential(credential)
                              .then((value) async {
                            Navigator.pushReplacementNamed(
                                context, "/lobby-page");
                          });
                        } catch (e) {
                          if (kDebugMode) print(e);
                        }
                      },
                      child: Text(AppText.confirmCode),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.chevron_left),
      ),
    );
  }
}
