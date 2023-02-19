import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ILoginService _loginService = LoginService();

  Future signInBloc(email, password, context) async {
    emit(LoginLoading());
    User? user = await _loginService.loginService(email, password, context);
    if (user != null) {
      Navigator.pushReplacementNamed(context, "/bottom-navbar-page");
    }
  }
}
