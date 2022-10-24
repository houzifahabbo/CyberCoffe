import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///do all the logic work on this page.
///I don't want to see anything design-related on this page.
/// I don't want to see the click event of a button or the regex event of a textfield on the view screen.
///Such this things are done on this page.
class LoginViewModel extends StatefulWidget {
  String label;
  LoginViewModel({Key? key, required this.label}) : super(key: key);

  @override
  State<LoginViewModel> createState() => _LoginViewModelState();
}

class _LoginViewModelState extends State<LoginViewModel> {
  Widget visibilityIcon = SvgPicture.asset(ImageConstants.visibilityIcon);
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(top: phoneHeight * 0.03),
        child: SizedBox(
            width: phoneWidth * 0.9,
            child: TextField(
                obscureText:
                    widget.label == "Password" ? isHidden : isHidden == false,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(
                        color: AppColorScheme.lightGrey, fontSize: 20),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorScheme.lightGrey)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorScheme.lightGrey)),
                    labelText: widget.label,
                    suffixIcon: widget.label == "Password"
                        ? Align(
                            widthFactor: phoneWidth * 0.001,
                            heightFactor: phoneHeight * 0.001,
                            child: IconButton(
                                icon: visibilityIcon,
                                onPressed: togglePasswordView),
                          )
                        : null))));
  }

  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
