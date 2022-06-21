import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<String> {
  UserCubit() : super("Engin");

  void isimDegistir(String ad) {
    var isim = ad;
    emit(isim);
  }
}
