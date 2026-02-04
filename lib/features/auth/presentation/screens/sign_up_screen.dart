import 'package:ecommerce_app/app/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgetsForScreen/app_logo.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
 static const String name = '/sign-up';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 12,),
                AppLogo(width: 80,),
                const SizedBox(height: 12,),
                Text('Create a new account',style: textTheme.titleLarge),
                Text('Get started with us with your details',style: textTheme.titleSmall,),
                const SizedBox(height: 12,),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller:_firstNameTEController ,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Mobile'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Address'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(hintText: 'Password'),),
                const SizedBox(height: 12,),
                FilledButton(
                    onPressed: _onTapSignUpButton, child: Text('Next',style: TextStyle(fontSize: 16),)),
                const SizedBox(height: 8,),
                TextButton(onPressed: _onTapMoveToSignInButton, child: Text('Sign in',style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
        ))
    );
  }
  void _onTapSignUpButton(){

  }
  void _onTapMoveToSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
