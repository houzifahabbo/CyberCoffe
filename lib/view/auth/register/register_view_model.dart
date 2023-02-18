import 'package:coffee/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
class RegisterViewModel{
  final LoginService _auth = LoginService();
  String email='';
  String password='';
  String fullName='';
  String phoneNum='';
  String error ='';
  bool isLoading = false;
  bool isHidden = true;
  final registerKey = GlobalKey<FormState>();

  Future <void> register() async{
    if(registerKey.currentState!.validate()){
      dynamic result = await _auth.register(email, password,fullName,phoneNum);
      if (result == null ){
        error = 'please enter a valid email';
        isLoading =false;
      }
    }
  }
  String? validator(String label,String val){
    if(label == 'Password'){
      if(val.length < 6) {
        return 'Enter a password 6+ chars long';
      }
    }
    if(label == 'Phone Number'){
      if(val.length != 10){
         return 'Enter a valid phone number';
      }
    }
    if(val.isEmpty){
      return 'Enter Your $label';
    }
    return null;
  }
  void onChanged(val,String label){
    switch (label){
      case 'Password':
        password = val;
        break;
      case 'Email':
        email = val;
        break;
      case 'Full Name':
        fullName = val;
        break;
      case 'Phone Number':
        phoneNum=val;
        break;
    }
  }
  void togglePasswordView() {
    isHidden = !isHidden;
  }
}
class TextfieldModel {
  final double phoneHeight;
  final double phoneWidth;
  final String label;
  final bool isHidden;

  TextfieldModel({required this.phoneHeight, required this.phoneWidth, required this.label, required this.isHidden});
}
