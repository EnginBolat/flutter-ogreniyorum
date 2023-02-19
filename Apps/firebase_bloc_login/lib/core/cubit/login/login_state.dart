part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginError extends LoginState {
  LoginError();
}
