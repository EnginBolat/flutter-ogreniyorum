// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userNameController = TextEditingController();

  final userPasswordController = TextEditingController();

  bool isAvalible = false;

  

  void isSame() {

    final enteredUserName = userNameController.text;
    final enteredPassword = userPasswordController.text;

    if ((enteredUserName == "test@test.com") &&
        (enteredPassword == "password")) {
      userNameController.text = "";
      userPasswordController.text = "";
      isAvalible = true;
      // ignore: avoid_print
      return print("Welcome");
    } 
    else 
    {
      userNameController.text = "";
      userPasswordController.text = "";
      // ignore: avoid_print
      return print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text(
            "Welcome The Cinema App!",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/loginScreen.png"),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: userNameController,
                  onSubmitted: (_) => isSame(),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  controller: userPasswordController,
                  onSubmitted: (_) => isSame(),
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints:const BoxConstraints.tightFor(width: 300, height: 50),
                  child: ElevatedButton(
                    onPressed: () => isSame(),
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // <-- Radius
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FlatButton(
                  child: const Text(
                    "Forgot Password!",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: isSame,
                ),
                FlatButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Email!",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
