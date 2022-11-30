import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///The design should be on this page. Widgets should be split.
///I have to reach events like click by saying model.blabla

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColorScheme.mainAppGrey,
        body: Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstants.background))),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.05) + EdgeInsets.only(top: phoneHeight * 0.2),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset(ImageConstants.starTitle),
                welcomeBackText(phoneHeight),
                descriptionText(phoneHeight),
                textField(textfieldModel: TextfieldModel(phoneHeight: phoneHeight, phoneWidth: phoneWidth, label: 'Email', isHidden: model.isHidden), model: model),
                textField(textfieldModel: TextfieldModel(phoneHeight: phoneHeight, phoneWidth: phoneWidth, label: 'Password', isHidden: model.isHidden), model: model),
                forgotPassword(phoneHeight, phoneWidth),
                loginButton(phoneWidth, phoneHeight, context)
              ]),
            ),
          ),
        ));
  }

  Widget welcomeBackText(double phoneHeight) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.02),
      child: const Text(
        'Welcome back!',
        style: TextStyle(fontSize: 35, color: Color(0xFF2e2d38), fontWeight: FontWeight.w900),
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

  Widget textField({required TextfieldModel textfieldModel, required LoginViewModel model}) {
    Widget visibilityIcon = SvgPicture.asset(ImageConstants.visibilityIcon);

    return Padding(
        padding: EdgeInsets.only(top: textfieldModel.phoneHeight * 0.03),
        child: SizedBox(
            width: textfieldModel.phoneWidth * 0.9,
            child: TextField(
                obscureText: textfieldModel.label == "Password" ? textfieldModel.isHidden : textfieldModel.isHidden == false,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(color: AppColorScheme.lightGrey, fontSize: 20),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColorScheme.lightGrey)),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColorScheme.lightGrey)),
                    labelText: textfieldModel.label,
                    suffixIcon: textfieldModel.label == "Password"
                        ? Align(
                            widthFactor: textfieldModel.phoneWidth * 0.001,
                            heightFactor: textfieldModel.phoneHeight * 0.001,
                            child: IconButton(
                                icon: visibilityIcon,
                                onPressed: () {
                                  model.togglePasswordView();
                                  setState(() {});
                                }),
                          )
                        : null))));
  }

  Widget forgotPassword(double phoneHeight, double phoneWidth) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
          padding: EdgeInsets.only(top: phoneHeight * 0.05),
          child: InkWell(
              onTap: () {
                //model.navigateToPage(context, 'forgotpassword');
                model.login();
              },
              child: const Text('Forgot your password?', style: TextStyle(color: AppColorScheme.mainAppDarkerGrey)))),
    );
  }

  Widget loginButton(double phoneWidth, double phoneHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.05),
      child: ElevatedButton(
        onPressed: () {
          model.navigateToPage(context, '/bottom');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.mainAppGreen,
          padding: EdgeInsets.symmetric(vertical: phoneWidth * 0.05, horizontal: phoneHeight * 0.1),
        ),
        child: const Center(child: Text('Login')),
      ),
    );
  }
}
