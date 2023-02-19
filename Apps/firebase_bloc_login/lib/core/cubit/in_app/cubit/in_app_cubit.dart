import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../model/person_model.dart';

part 'in_app_state.dart';

class InAppCubit extends Cubit<InAppState> {
  InAppCubit() : super(InAppInitial());

  Future<void> getCurrentUserInfoCubit(User? currentUser) async {
    emit(CurrentUserInfoLoading());
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Person')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        Person person = Person(
            email: ds['email'],
            name: ds['name'],
            surname: ds['surname'],
            phone: ds['phone'],
            password: ds['password']);
        emit(CurrentUserInfo(person));
      }).catchError((e) {
        print(e);
        emit(CurrentUserInfoError());
      });
    }
  }
}
