import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_login/constants/app_radius.dart';
import 'package:firebase_bloc_login/constants/app_text.dart';
import 'package:firebase_bloc_login/core/service/firebase_service/firebase_service.dart';
import 'package:firebase_bloc_login/gen/translations.g.dart';
import 'package:firebase_bloc_login/view/otp_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_padding.dart';
import '../core/cubit/signin/cubit/sign_in_cubit.dart';
import '../widgets/user_info_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController phoneController;
  late TextEditingController countryCodeController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuthService authService = FirebaseAuthService();

  @override
  void initState() {
    nameController = TextEditingController();
    surnameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    countryCodeController = TextEditingController();
    countryCodeController.text = "+90";
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.normalValue),
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/assets/images/img_register.png",
                        fit: BoxFit.fill,
                      ),
                      UserInfoTextfield(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        hintText: LocaleKeys.SignInPage_name.tr(),
                        obsecureText: false,
                        icon: const Icon(Icons.person),
                      ),
                      UserInfoTextfield(
                        controller: surnameController,
                        keyboardType: TextInputType.name,
                        hintText: LocaleKeys.SignInPage_surname.tr(),
                        obsecureText: false,
                        icon: const Icon(Icons.person),
                      ),
                      CustomTextfield(
                        text: AppText.phoneNumber,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        countryCodeController: countryCodeController,
                      ),
                      UserInfoTextfield(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: LocaleKeys.SignInPage_email.tr(),
                        obsecureText: false,
                        icon: const Icon(Icons.email),
                      ),
                      UserInfoTextfield(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: LocaleKeys.SignInPage_password.tr(),
                        obsecureText: true,
                        icon: const Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.03,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: deviceHeight * 0.05,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppRadius.loginButtonRadius),
                          child: ElevatedButton(
                            onPressed: () async {
                              var phone = countryCodeController.text +
                                  phoneController.text;
                              if (countryCodeController.text != "" &&
                                  phoneController.text != "" &&
                                  nameController.text != "" &&
                                  surnameController != "" &&
                                  emailController.text != "" &&
                                  passwordController.text != "") {
                                context
                                    .read<SignInCubit>()
                                    .verifyPhoneNumberCubit(
                                      nameController.text,
                                      surnameController.text,
                                      phone,
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    AppText.fieldsCannotBeEmpty,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            },
                            child: Text(
                              LocaleKeys.SignInPage_signup.tr(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(AppText.signUpText),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.chevron_left_rounded,
          color: Colors.black,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {Key? key,
      required this.text,
      required this.controller,
      required this.keyboardType,
      required this.countryCodeController})
      : super(key: key);

  final String text;
  final TextEditingController controller;
  final TextEditingController countryCodeController;
  final TextInputType keyboardType;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.normalValue),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(AppRadius.minValue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceWidth * 0.10,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "",
                  border: InputBorder.none,
                ),
                controller: widget.countryCodeController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppPadding.minValue),
              child: Container(
                width: 1,
                color: Colors.grey,
                child: const Text(""),
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: TextField(
                decoration: InputDecoration(
                  hintText: widget.text,
                  border: InputBorder.none,
                ),
                controller: widget.controller,
                keyboardType: widget.keyboardType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
