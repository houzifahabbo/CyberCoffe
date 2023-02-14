import 'package:coffee/models/user.dart';
import 'package:coffee/view/auth/login/auth_view.dart';
import 'package:coffee/view/bottom_nav_bar/bottom_nav_bar_view/bottom_nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserFb?>(context);
    if(user!=null){
      return MainBottomNavBar();
    }
    return const AuthView();
  }
}
