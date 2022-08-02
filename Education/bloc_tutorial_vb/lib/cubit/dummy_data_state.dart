part of 'dummy_data_cubit.dart';

@immutable
abstract class DummyDataState {}

class DummyDataInitial extends DummyDataState {
  DummyDataInitial();
}

class DummyDataIsLoading extends DummyDataState {
  DummyDataIsLoading();
}

class DummyDataLoaded extends DummyDataState {
  final List<DummyData> repsonse;
  DummyDataLoaded(this.repsonse);
}

class DummyDataError extends DummyDataState {
  final String error;
  DummyDataError(this.error);
}
