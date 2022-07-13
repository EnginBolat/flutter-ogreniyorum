import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'constants/theme/theme.dart';
import 'view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.savedThemeMode}) : super(key: key);
  final ConstThemes themes = ConstThemes();
  final savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: themes.lightTheme,
      dark: themes.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (lightTheme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        title: 'ATL',
        home: const HomePage(),
      ),
    );
  }
}
