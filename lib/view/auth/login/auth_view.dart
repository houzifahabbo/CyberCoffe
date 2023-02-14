import 'package:coffee/view/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';

import '../register/register_view.dart';
import 'auth_view_model.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final AuthViewModel model = AuthViewModel();
   void toggle(){setState(()=> model.toggleView());}

  @override
  Widget build(BuildContext context) {
    if(model.login == false){
      return RegisterView(toggle: toggle);
    }
    return LoginView(toggle: toggle);
  }
}
