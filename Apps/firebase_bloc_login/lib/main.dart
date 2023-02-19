import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_bloc_login/constants/app_lang.dart';
import 'package:firebase_bloc_login/constants/app_theme.dart';
import 'package:firebase_bloc_login/view/bottom_navbar_page.dart';
import 'package:firebase_bloc_login/view/language_settings_page.dart';
import 'package:firebase_bloc_login/view/lobby_page.dart';
import 'package:firebase_bloc_login/view/login_page.dart';
import 'package:firebase_bloc_login/view/settings_page.dart';
import 'package:firebase_bloc_login/view/share_photo.dart';
import 'package:firebase_bloc_login/view/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grock/grock.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(
    EasyLocalization(
      supportedLocales: AppLang.SUPPORTED_LOCALE,
      path: AppLang.LANG_PATH,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme().lightTheme,
      navigatorKey: Grock.navigationKey,
      title: "Firebase Login",
      routes: {
        "/lobby-page": (context) => const LobbyPage(),
        "/login-page": (context) => const LoginPage(),
        "/signup-page": (context) => const SignUpPage(),
        "/settings-page": (context) => const SettingsPage(),
        "/language-setting-page": (context) => const LanguageSettingsPage(),
        "/bottom-navbar-page": (context) => const BottomNavBarPage(),
        "/share-photo": (context) => const SharePhoto(),
      },
      home: const LobbyPage(),
    );
  }
}
