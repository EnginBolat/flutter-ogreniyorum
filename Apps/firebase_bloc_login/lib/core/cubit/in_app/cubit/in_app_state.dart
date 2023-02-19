part of 'in_app_cubit.dart';

@immutable
abstract class InAppState {}

class InAppInitial extends InAppState {}

class CurrentUserInfoLoading extends InAppState {
  CurrentUserInfoLoading();
}

class CurrentUserInfo extends InAppState {
  final Person? currentUser;

  CurrentUserInfo(this.currentUser);
}

class CurrentUserInfoError extends InAppState {
  CurrentUserInfoError();
}
