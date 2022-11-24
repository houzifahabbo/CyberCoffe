import 'package:flutter/material.dart';

///do all the logic work on this page.
///I don't want to see anything design-related on this page.
/// I don't want to see the click event of a button or the regex event of a textfield on the view screen.
///Such this things are done on this page.

class LoginViewModel {
  bool isHidden = true;

  void togglePasswordView() {
    isHidden = !isHidden;
  }

  Future<void> login() async {
    print("clicked login");
  }

  void navigateToPage(BuildContext context, String pageName) {
    Navigator.pushReplacementNamed(context, pageName);
  }
}

class TextfieldModel {
  final double phoneHeight;
  final double phoneWidth;
  final String label;
  final bool isHidden;

  TextfieldModel({required this.phoneHeight, required this.phoneWidth, required this.label, required this.isHidden});
}
