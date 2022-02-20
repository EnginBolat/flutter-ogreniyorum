import 'package:flutter/material.dart';
import 'package:login_register_screen/widgets/textfield_design.dart';

import 'home_page.dart';
import '../widgets/appBar_design.dart';
import '../widgets/button_design.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passworController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarBackButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/todo.png"),
                ),
                CustomTextField(
                    labelmesaj: "Email",
                    komut: () {},
                    kontrol: emailController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelmesaj: "Password",
                    komut: () {},
                    kontrol: passworController),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonDesign(
                  butonBaslik: "Login",
                  komut: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
