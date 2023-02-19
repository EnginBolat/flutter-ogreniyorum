import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_bloc_login/gen/translations.g.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(LocaleKeys.SettingsPage_settings).tr(),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text(LocaleKeys.SettingsPage_languageSettings).tr(),
              onTap: () {
                Navigator.of(context).pushNamed('/language-setting-page');
              },
            ),
          ),
        ],
      ),
    );
  }
}
