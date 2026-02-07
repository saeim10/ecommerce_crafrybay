

import 'package:ecommerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:get/get.dart';

class BackToHome{
  static void backToHome(){
    Get.find<MainNavController>().backToHome();

  }
}