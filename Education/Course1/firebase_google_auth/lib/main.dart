import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const GoogleSignInApp());
}

class GoogleSignInApp extends StatefulWidget {
  const GoogleSignInApp({Key? key}) : super(key: key);

  @override
  State<GoogleSignInApp> createState() => _GoogleSignInAppState();
}

class _GoogleSignInAppState extends State<GoogleSignInApp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Google Sign In (Signed " + (user == null ? "out" : "in") + ")"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
              onPressed: user != null
                  ? null
                  : () async {
                      await _googleSignIn.signIn();
                      setState(() {});
                    },
              child: const Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: user == null
                  ? null
                  : () async {
                      await _googleSignIn.signOut();
                      setState(() {});
                    },
              child: const Text("Sign Out"),
            ),
          ]),
        ),
      ),
    );
  }
}
