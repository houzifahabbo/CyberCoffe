import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

///The design should be on this page. Widgets should be split.
///I have to reach events like click by saying model.blabla

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel emailTextField = LoginViewModel(label: "Email");
  final LoginViewModel passwordTextField = LoginViewModel(label: "Password");
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColorScheme.mainAppGrey,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.background))),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.05, top: phoneHeight * 0.2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImageConstants.starTitle),
                    welcomeBackText(phoneHeight),
                    descriptionText(phoneHeight),
                    emailTextField,
                    passwordTextField,
                    forgotPassword(phoneHeight, phoneWidth),
                    loginButton(phoneWidth,phoneHeight, context)
                  ]),
            ),
          ),
        ));
  }

  Padding welcomeBackText(double phoneHeight) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.02),
      child: const Text(
        'Welcome back!',
        style: TextStyle(
            fontSize: 35,
            color: Color(0xFF2e2d38),
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Padding descriptionText(double phoneHeight) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.02),
      child: const Text(
        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit sed do eiusmod tempor',
        style: TextStyle(
          color: Color(0xff4d5661),
          fontSize: 16,
        ),
      ),
    );
  }

  Padding forgotPassword(double phoneHeight, double phoneWidth) {
    return Padding(
        padding:
            EdgeInsets.only(top: phoneHeight * 0.05, left: phoneWidth * 0.55),
        child: InkWell(
            onTap: () {
              print('Text Clicked');
            },
            child: const Text('Forgot your password?',
                style: TextStyle(color: AppColorScheme.mainAppDarkerGrey))));
  }

  Padding loginButton(double phoneWidth,double phoneHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.05),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/bottom');
        },
            style:ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.mainAppGreen,
              padding: EdgeInsets.symmetric(vertical:phoneWidth*0.05, horizontal:phoneHeight*0.193),
            ),
        child: const Text('Login'),
      ),
    );
  }
}
