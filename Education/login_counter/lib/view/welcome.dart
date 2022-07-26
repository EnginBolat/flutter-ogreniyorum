import 'package:flutter/material.dart';

import '../constants/const_text.dart';
import '../services/login_counter_service.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  final LoginService service = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppText.welcome),
            ElevatedButton(
              onPressed: () async {
                await service.setUserLogin();
              },
              child: Text(
                AppText.welcomeButtonText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
