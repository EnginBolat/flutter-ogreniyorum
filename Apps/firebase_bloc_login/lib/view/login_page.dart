import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_login/constants/app_padding.dart';
import 'package:firebase_bloc_login/gen/translations.g.dart';
import 'package:firebase_bloc_login/widgets/user_info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_radius.dart';
import '../core/cubit/login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool? remindMe = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.text = "engin.bolat@gmail.com";
    passwordController.text = "merhaba1";
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(AppPadding.normalValue),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/images/img_login.png",
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      UserInfoTextfield(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: LocaleKeys.LoginPageText_email.tr(),
                        obsecureText: false,
                        icon: const Icon(Icons.person),
                      ),
                      UserInfoTextfield(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        hintText: LocaleKeys.LoginPageText_password.tr(),
                        obsecureText: true,
                        icon: const Icon(Icons.lock),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: remindMe,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      remindMe = value;
                                    },
                                  );
                                },
                              ),
                              const Text("Beni Hatırla"),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Şifremi Unuttum"),
                          ),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      SizedBox(
                        width: double.infinity,
                        height: deviceHeight * 0.05,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppRadius.loginButtonRadius),
                          child: ElevatedButton(
                            onPressed: () async {
                              context.read<LoginCubit>().signInBloc(
                                  emailController.text,
                                  passwordController.text,
                                  context);
                            },
                            child: const Text(LocaleKeys.LoginPageText_login,
                                    style: TextStyle(color: Colors.white))
                                .tr(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
