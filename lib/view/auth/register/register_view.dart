import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/register/register_view_model.dart';
import 'package:coffee/view/loader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../product/constants/color_scheme.dart';

class RegisterView extends StatefulWidget {
  final Function toggle;
  const RegisterView({required this.toggle,Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel model = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColorScheme.backgroundGrey,
      body: model.isLoading? const LoadingView() :
      SafeArea(
        child: Form(
          key: model.registerKey,
              child: Column(
                children: [
                  textField(textfieldModel: TextfieldModel(phoneHeight: phoneHeight, phoneWidth: phoneWidth, label: 'Email', isHidden: true)),
                  textField(textfieldModel: TextfieldModel(phoneHeight: phoneHeight, phoneWidth: phoneWidth, label: 'Password', isHidden: true),),
                  Text(model.error,style: const TextStyle( color: Colors.red),),

                  registerButton(phoneWidth, phoneHeight, context),
                  Row(
                    children: [
                      const Text("Already have an account? ",style: TextStyle(color: AppColorScheme.mainAppDarkerGrey)),
                      clickableText('Sign in', widget.toggle),
                    ],
                  )
                ],
              ),
            )
      ),
    );
  }
  Widget textField({required TextfieldModel textfieldModel}) {
    Widget visibilityIcon = SvgPicture.asset(ImageConstants.visibilityIcon);
    return Padding(
        padding: EdgeInsets.only(top: textfieldModel.phoneHeight * 0.03),
        child: SizedBox(
            width: textfieldModel.phoneWidth * 0.9,
            child: TextFormField(
                validator: textfieldModel.label == "Password"? (val)=> val!.length < 8 ? 'Enter a password 8+ chars long' : null :(val) => val!.isEmpty ? 'Enter an email' : null,
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
                    suffixIcon: textfieldModel.label == "Password" ?
                    IconButton(
                          icon: visibilityIcon,
                          onPressed: () {
                            widget.toggle;
                            setState(() {});
                          })
                        : null
                )
            )
        )
    );
  }

  Widget registerButton(double phoneWidth, double phoneHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: phoneHeight * 0.05),
      child: ElevatedButton(
        onPressed: () async{
          if(model.registerKey.currentState!.validate()){
            setState(() {model.isLoading = true;});
          }
          await model.register();
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.mainAppGreen,
          padding: EdgeInsets.symmetric(vertical: phoneWidth * 0.05, horizontal: phoneHeight * 0.1),
        ),
        child: const Center(child: Text('Register')),
      ),
    );
  }
  Widget clickableText(String label, Function onTap) {
    return InkWell(
              onTap: () {
                onTap();
              },
              child: Text(label,style: const TextStyle(color: AppColorScheme.mainAppDarkerGrey)),
    );
  }
}
