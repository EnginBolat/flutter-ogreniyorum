import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../constants/text/const_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Theme Manager
    final themeManager = AdaptiveTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstText.appBarTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (themeManager.mode.isDark) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
              child: Text(ConstText.buttonText),
            ),
          )
        ],
      ),
    );
  }
}
