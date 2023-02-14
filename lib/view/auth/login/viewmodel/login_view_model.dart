import 'package:coffee/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';

///do all the logic work on this page.
///I don't want to see anything design-related on this page.
/// I don't want to see the click event of a button or the regex event of a textfield on the view screen.
///Such this things are done on this page.
class LoginViewModel {
  bool isHidden = true;
  String email='';
  String password='';
  String error='';
  bool isLoading = false;
  final LoginService _auth = LoginService();
  final loginKey = GlobalKey<FormState>();

  Future <void> login() async{
    if(loginKey.currentState!.validate()){
      dynamic result = await _auth.login(email, password);
      if(result == null){
        error = 'Incorrect email or password';
        isLoading =false;
      }
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
  }

  void navigateToPage(BuildContext context, String pageName) {
    Navigator.pushReplacementNamed(context, pageName);
  }

  void onChanged(val,bool isItPassword){
    if(isItPassword == true){
      password = val;
    }
    else{
      email = val;
    }
  }
}

class TextfieldModel {
  final double phoneHeight;
  final double phoneWidth;
  final String label;
  final bool isHidden;

  TextfieldModel({required this.phoneHeight, required this.phoneWidth, required this.label, required this.isHidden});
}
