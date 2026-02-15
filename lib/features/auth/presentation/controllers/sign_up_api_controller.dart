

import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/models/network_response.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:get/get.dart';

class SignUpApiController extends GetxController{
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpRequestModel model) async{
    bool isSuccess = false;
    _signUpInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url:Urls.singUpUrl, body:model.toJson());
    if(response.isSuccess){
      _errorMessage = null;
         isSuccess = true;
    }else{
      _errorMessage = response.body?['msg'] ?? response.errorMessage;
    }
    _signUpInProgress = false;
    update();
    return isSuccess;
  }
}

