import 'package:flutter/material.dart';

import '../widgets/button_design.dart';
import 'login_page.dart';
import '../widgets/appbar_design.dart';
import '../widgets/textfield_design.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarBackButton(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 200,
                      width: 300,
                      child: Image.asset("assets/images/todo.png")),
                  CustomTextField(
                    labelmesaj: "Username",
                    komut: () {},
                    kontrol: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelmesaj: "Email",
                    komut: () {},
                    kontrol: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    labelmesaj: "Password",
                    komut: () {},
                    kontrol: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonDesign(
                    butonBaslik: "Login",
                    komut: () {
                      Navigator.pushReplacement(
                          context,
                           MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
