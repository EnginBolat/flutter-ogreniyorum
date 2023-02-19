part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFetch extends HomeState {
  final List<HomePageModel>? list;
  HomeFetch(this.list);
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeError extends HomeState {
  final String errorText;
  HomeError(this.errorText);
}
