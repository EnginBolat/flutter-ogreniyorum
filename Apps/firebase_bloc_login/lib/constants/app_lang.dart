import 'package:flutter/rendering.dart';

class AppLang {
  static const SUPPORTED_LOCALE = [AppLang.EN_LOCALE, AppLang.TR_LOCALE];

  static const SUPPORTED_LANG = ["English", "Türkçe"];

  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "lib/assets/lang";
}
