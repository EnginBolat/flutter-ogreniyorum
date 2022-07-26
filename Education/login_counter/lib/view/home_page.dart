import 'package:flutter/material.dart';
import 'package:login_counte/services/login_counter_service.dart';
import 'package:login_counte/view/welcome.dart';
import 'package:login_counte/view/welcome_back.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginService service = LoginService();
  bool? isLogin;

  @override
  void initState() {
    getLogin();
    super.initState();
  }

  void getLogin() async {
    isLogin = await service.getLogin();
    setState(() => isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return isLogin != true ? Welcome() : WelcomeBack();
  }
}
