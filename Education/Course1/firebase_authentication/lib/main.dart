import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AuthApp());
}

class AuthApp extends StatefulWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  State<AuthApp> createState() => _AuthAppState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final GlobalKey<FormState> _key = GlobalKey<FormState>();
String errorMessage = "";
bool isLoading = false;

class _AuthAppState extends State<AuthApp> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("Auth User(Logged " + (user == null ? "out" : "in") + ")"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        onPressed: () {
                          emailController.text = "";
                        },
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        onPressed: () {
                          passwordController.text = "";
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Sign Up"),
                        onPressed: user != null
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                  errorMessage = "";
                                });
                                if (_key.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    errorMessage = "";
                                  } on FirebaseAuthException catch (error) {
                                    errorMessage = error.message!;
                                  }

                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                      ),
                      ElevatedButton(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text("Sign In"),
                          onPressed: user != null
                              ? null
                              : () async {
                                  setState(() {
                                    isLoading = true;
                                    errorMessage = "";
                                  });
                                  if (_key.currentState!.validate()) {
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    } on FirebaseAuthException catch (error) {
                                      errorMessage = error.message!;
                                    }
                                    setState(() => isLoading = false);
                                  }
                                }),
                      ElevatedButton(
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Log Out"),
                        onPressed: user == null
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await FirebaseAuth.instance.signOut();
                                  errorMessage = "";
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail Adresi Gerekli.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Yanlış E-mail Biçimi.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Şifre Gerekli.';
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Şifreniz en az  8 karakterden oluşmalı,
      büyük harf,sembol ve sayı içermelidir.
      ''';
  }

  return null;
}
