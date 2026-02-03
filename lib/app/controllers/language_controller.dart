
import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController{
   Locale _currentLocale = Locale('en');
  final List<Locale> _selectedLocale = [Locale('en'),Locale('bn')];

  Locale get currentLocale => _currentLocale;
  List<Locale> get selectedLocale => _selectedLocale;

  void changeLocale(Locale locale){
    if(_currentLocale == locale){
      return;
    }
    _currentLocale = locale;
    update();
  }
}