import 'package:firebase_bloc_login/constants/app_padding.dart';
import 'package:flutter/material.dart';

import '../core/service/firebase_service/firebase_auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              _authService.signOut();
              Navigator.pushReplacementNamed(context, "/lobby-page");
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.normalValue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppPadding.normalValue),
                child: Text(
                  "Engin Bolat",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
