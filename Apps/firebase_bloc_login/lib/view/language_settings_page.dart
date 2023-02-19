
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_lang.dart';
import '../gen/translations.g.dart';


class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(LocaleKeys.SettingsPage_languageSettings).tr(),
      ),
      body: ListView.builder(
        itemCount: AppLang.SUPPORTED_LANG.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(AppLang.SUPPORTED_LANG[index]),
              onTap: () {
                context.setLocale(AppLang.SUPPORTED_LOCALE[index]);
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
