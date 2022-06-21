// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayac_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SayacModel on SayacModelBase, Store {
  final _$sayacAtom = Atom(name: 'SayacModelBase.sayac');

  @override
  int get sayac {
    _$sayacAtom.reportRead();
    return super.sayac;
  }

  @override
  set sayac(int value) {
    _$sayacAtom.reportWrite(value, super.sayac, () {
      super.sayac = value;
    });
  }

  final _$SayacModelBaseActionController =
      ActionController(name: 'SayacModelBase');

  @override
  void sayaciArttir() {
    final _$actionInfo = _$SayacModelBaseActionController.startAction(
        name: 'SayacModelBase.sayaciArttir');
    try {
      return super.sayaciArttir();
    } finally {
      _$SayacModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sayaciAzalt(int miktar) {
    final _$actionInfo = _$SayacModelBaseActionController.startAction(
        name: 'SayacModelBase.sayaciAzalt');
    try {
      return super.sayaciAzalt(miktar);
    } finally {
      _$SayacModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sayac: ${sayac}
    ''';
  }
}
