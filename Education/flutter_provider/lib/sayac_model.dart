import 'package:flutter/material.dart';

class SayacModel extends ChangeNotifier {
  int sayac = 0;

  int sayaciOku() {
    return sayac;
  }

  void sayaciArttir() {
    sayac = sayac + 1;
    notifyListeners();
  }

  void sayaciAzalt(int miktar){
    sayac=sayac-miktar;
    notifyListeners();
  }
}
