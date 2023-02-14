import 'package:coffee/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
class RegisterViewModel{
  final LoginService _auth = LoginService();
  String email='';
  String password='';
  String error ='';
  bool isLoading = false;
  final registerKey = GlobalKey<FormState>();

  Future <void> register() async{
    if(registerKey.currentState!.validate()){
      dynamic result = await _auth.register(email, password);
      if (result == null ){
        error = 'please enter a valid email';
        isLoading =false;
      }
    }
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
