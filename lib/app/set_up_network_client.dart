
import 'package:ecommerce_app/app/app.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

NetworkCaller setUpNetworkClient() {
  return NetworkCaller(onUnAuthorize: _onUnAuthorize, accessToken:  (){return "";}
       );
}

Future<void> _onUnAuthorize() async {
  // TODO: remove cache
  Navigator.pushNamedAndRemoveUntil(
    CraftyBay.navigatorKey.currentContext!,
    SignInScreen.name,
        (predicate) => false,
  );
}
