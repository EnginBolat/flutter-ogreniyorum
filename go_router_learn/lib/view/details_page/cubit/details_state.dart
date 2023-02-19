part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {
  DetailsLoading();
}

class DetailsFetch extends DetailsState {
  final DetailsPageModel? item;
  DetailsFetch(this.item);
}

class DetailsError extends DetailsState {
  final String errorText;
  DetailsError(this.errorText);
}
