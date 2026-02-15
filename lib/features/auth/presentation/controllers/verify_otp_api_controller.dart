

import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/models/network_response.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/shared/data/models/user_model.dart';
import 'package:get/get.dart';

class VerifyOtpApiController extends GetxController{
  bool _verifyOtpInProgress = false;
  bool get verifyOtpInProgress => _verifyOtpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  String? _accessToken;
  String? get accessToken => _accessToken;

  Future<bool> verifyOtp(VerifyOtpRequestModel model) async{
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url:Urls.verifyOtpUrl, body:model.toJson());
    if(response.isSuccess){
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    }else{
      _errorMessage = response.body?['msg'] ?? response.errorMessage;
    }
    _verifyOtpInProgress = false;
    update();
    return isSuccess;
  }
}

