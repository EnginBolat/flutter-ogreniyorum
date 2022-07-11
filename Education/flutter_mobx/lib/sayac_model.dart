import 'package:mobx/mobx.dart';

part 'sayac_model.g.dart';

class SayacModel = SayacModelBase with _$SayacModel;

abstract class SayacModelBase with Store {
  @observable
  int sayac = 0;

  @action
  void sayaciArttir() {
    sayac = sayac + 1;
  }

  @action
  void sayaciAzalt(int miktar) {
    sayac = sayac - miktar;
  }
}
