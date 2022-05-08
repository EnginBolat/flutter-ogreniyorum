import 'package:get/get.dart';

class Controller extends GetxController{
  var counter = 0.obs;
  void increment(){
    counter++;
  }
}