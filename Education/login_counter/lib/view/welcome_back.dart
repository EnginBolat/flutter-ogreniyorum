import 'package:flutter/material.dart';

import '../constants/const_text.dart';
import '../services/login_counter_service.dart';

class WelcomeBack extends StatelessWidget {
  WelcomeBack({Key? key}) : super(key: key);
  final LoginService service = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppText.welcomeBack),
            ElevatedButton(
              onPressed: () async {
                await service.removeUserLogin();
              },
              child: Text(AppText.welcomeBackButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
