part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {
  SignInLoading();
}

class SignInCreateUser extends SignInState {}

class SignInError extends SignInState {
  final String errorText;

  SignInError(this.errorText);
}
