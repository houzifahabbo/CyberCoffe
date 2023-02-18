import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel{
  String email = '';
  String content = '';
  bool error = false;
  bool isLoading = false;
  final LoginService _auth = LoginService();
  Future <void> reset(BuildContext context) async{
    if(forgotKey.currentState!.validate()){
      dynamic authStatusSuccessful = await _auth.resetPassword(email);
      if (authStatusSuccessful == false){
        content = 'please enter a valid email';
        isLoading =false;
        error=true;
      }
      else{
        content = 'Reset email has been sent';
        error =false;
        Navigator.pop(context);
      }
      final snackBar = SnackBar(content: Text(content),backgroundColor:error==true?AppColorScheme.error:Colors.green);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final forgotKey = GlobalKey<FormState>();
  void onChanged(val){
    email = val;
  }
}