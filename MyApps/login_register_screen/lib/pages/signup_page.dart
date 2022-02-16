import 'package:flutter/material.dart';

import '../widgets/button_design.dart';
import 'login_page.dart';
import '../widgets/appbar_design.dart';
import '../widgets/textfield_design.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                  CustomTextField(labelmesaj: "Username", komut: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(labelmesaj: "Email", komut: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(labelmesaj: "Password", komut: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonDesign(
                    butonBaslik: "Login",
                    komut: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
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
