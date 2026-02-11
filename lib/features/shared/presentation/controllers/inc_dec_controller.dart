
import 'package:get/get.dart';

class IncDecController extends GetxController{
  int _currentValue = 1;
  int get currentValue => _currentValue;

  void removeCartButton(){
    if(_currentValue > 1){
      _currentValue--;
      update();
    }
  }
  void addCartButton() {
    _currentValue++;
    update();
  }

}