
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/models/network_response.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/home/data/models/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeSliderApiController extends GetxController{
  bool _getSliderInProgress = false;
  bool get getSliderInProgress => _getSliderInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<HomeSlider> _sliders = [];
  List<HomeSlider> get sliders => _sliders;

  Future<bool> getHomeSlider() async{
    bool isSuccess = false;
    _getSliderInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.homeSliderUrl);
    debugPrint('Response:${response.statusCode}');
    if(response.isSuccess){
      _errorMessage = null;
      List<HomeSlider> listOfSliders = [];
      for(Map<String, dynamic> jsonData in response.body!['data']['results']){
        listOfSliders.add(HomeSlider.fromJson(jsonData));
      }
       _sliders = listOfSliders;
      isSuccess = true;
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _getSliderInProgress = false;
    update();
    return isSuccess;
  }
}