import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_login/constants/app_image.dart';
import 'package:firebase_bloc_login/core/service/login_service.dart';
import 'package:firebase_bloc_login/gen/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_padding.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  late final ILoginService _loginService;

  @override
  void initState() {
    super.initState();
    _loginService = LoginService();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/settings-page");
            },
            icon: const Icon(Icons.settings, color: Colors.grey),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.normalValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: deviceHeight * 0.05),
              Image.asset(
                "lib/assets/images/img_welcome.png",
                fit: BoxFit.fill,
              ),
              SizedBox(height: deviceHeight * 0.05),
              CustomNavigatorButton(
                text: LocaleKeys.LobbyPageText_login,
                func: () {
                  Navigator.of(context).pushNamed("/login-page");
                },
                context: context,
              ),
              CustomNavigatorButton(
                text: LocaleKeys.LobbyPageText_signup,
                func: () {
                  Navigator.of(context).pushNamed("/signup-page");
                },
                context: context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(AppPadding.maxValue),
                    child: const Text(LocaleKeys.LobbyPageText_or).tr(),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: deviceHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginWithButton(
                    url: AppImage.googleLogoOrange,
                    func: () {},
                  ),
                  LoginWithButton(
                    url: AppImage.twitterLogoOrange,
                    func: () async {
                      if (kDebugMode) print("Twitter");
                    },
                  ),
                  LoginWithButton(
                    url: AppImage.appleLogoOrange,
                    func: () {
                      if (kDebugMode) print("Apple");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginWithButton extends StatelessWidget {
  const LoginWithButton({
    Key? key,
    required this.url,
    required this.func,
  }) : super(key: key);

  final String url;
  final Function()? func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[100],
        child: SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(
            url,
          ),
        ),
      ),
    );
  }
}

class CustomNavigatorButton extends StatelessWidget {
  const CustomNavigatorButton(
      {Key? key, required this.text, required this.func, required this.context})
      : super(key: key);

  final String text;
  final Function()? func;
  final BuildContext context;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: func,
        child: Text(text, style: const TextStyle(color: Colors.white)).tr(),
      ),
    );
  }
}
