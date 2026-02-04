import 'package:ecommerce_app/app/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgetsForScreen/app_logo.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 48,),
              AppLogo(width: 90,),
              const SizedBox(height: 16,),
              Text(context.localization.welcomeBack,style: textTheme.titleLarge),
              Text(context.localization.loginHeadline,style: textTheme.titleSmall,),
              const SizedBox(height: 24,),
              TextFormField(
                controller: _emailTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(hintText: 'Password'),),
              const SizedBox(height: 16,),
              FilledButton(
                  onPressed: _onTapSignInButton, child: Text('Next',style: TextStyle(fontSize: 16),)),
              const SizedBox(height: 16,),
              TextButton(onPressed: _onTapMoveToSignUp, child: Text('Sign up',style: TextStyle(fontSize: 18),))
            ],
          ),
        ),
      ))
    );
  }
   void _onTapSignInButton(){
     Navigator.pushNamedAndRemoveUntil(context, VerifyOtpScreen.name, (p)=> false);

   }
   void _onTapMoveToSignUp(){
    Navigator.pushNamed(context, SignUpScreen.name);
   }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
