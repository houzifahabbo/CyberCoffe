import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/login/viewmodel/login_view_model.dart';
import 'package:coffee/view/loader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///The design should be on this page. Widgets should be split.
///I have to reach events like click by saying model.blabla

class LoginView extends StatefulWidget {
  final Function toggle;
  LoginView({Key? key, required this.toggle}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return model.isLoading
        ? const LoadingView()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColorScheme.mainAppGrey,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.background))),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.05) +
                      EdgeInsets.only(top: phoneHeight * 0.2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(ImageConstants.starTitle),
                        welcomeBackText(),
                        descriptionText(),
                        Form(
                            key: model.loginKey,
                            child: Column(
                              children: [
                                textField(
                                    textfieldModel: TextfieldModel(
                                        phoneHeight: phoneHeight,
                                        phoneWidth: phoneWidth,
                                        label: 'Email',
                                        isHidden: true),
                                    model: model),
                                textField(
                                    textfieldModel: TextfieldModel(
                                        phoneHeight: phoneHeight,
                                        phoneWidth: phoneWidth,
                                        label: 'Password',
                                        isHidden: model.isHidden),
                                    model: model),
                              ],
                            )),
                        Text(
                          model.error,
                          style: const TextStyle(color: AppColorScheme.error),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(vertical:20),
                            child: clickableText('Forgot your password?',model.navigateToPage,true)),
                        loginButton(phoneWidth),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              clickableText('Sign Up', widget.toggle,false),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
  }

  Widget welcomeBackText() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Text(
        'Welcome back!',
        style: TextStyle(
            fontSize: 35,
            color: Color(0xFF2e2d38),
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Padding descriptionText() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit sed do eiusmod tempor',
        style: TextStyle(
          color: AppColorScheme.mainAppDarkerGrey,
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
            child: TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                obscureText: textfieldModel.label == "Password"
                    ? textfieldModel.isHidden
                    : textfieldModel.isHidden == false,
                onChanged: (val) {
                  setState(() {
                    model.onChanged(val, textfieldModel.label == "Password");
                  });
                },
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
                    labelText: textfieldModel.label,
                    suffixIcon: textfieldModel.label == "Password"
                        ? IconButton(
                            icon: visibilityIcon,
                            onPressed: () {
                              model.togglePasswordView();
                              setState(() {});
                            })
                        : null))));
  }

  Widget clickableText(String label, Function onTap,bool isContextRequired) {
    return InkWell(
      onTap: () {
        if(isContextRequired==true){
          onTap(context);
        }
        else{
          onTap();
        }
      },
      child: Text(label,
          style: const TextStyle(color: AppColorScheme.mainAppDarkerGrey)),
    );
  }

  Widget loginButton(double phoneWidth) {
    return SizedBox(
        width: phoneWidth * 0.9,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            if (model.loginKey.currentState!.validate()) {
              setState(() {
                model.isLoading = true;
              });
            }
            await model.login();
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorScheme.mainAppGreen,
          ),
          child: const Center(child: Text('Login')),
        ));
  }
}
