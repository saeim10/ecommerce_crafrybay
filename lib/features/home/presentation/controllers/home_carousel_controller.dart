import 'package:get/get.dart';

class HomeCarouselController extends GetxController {
  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    update(); // UI notify
  }
}
