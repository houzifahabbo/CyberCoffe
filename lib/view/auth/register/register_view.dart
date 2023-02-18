import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/register/register_view_model.dart';
import 'package:coffee/view/loader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../product/constants/color_scheme.dart';

class RegisterView extends StatefulWidget {
  final Function toggle;
  const RegisterView({required this.toggle, Key? key}) : super(key: key);

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
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColorScheme.backgroundGrey,
        body: model.isLoading
            ? const LoadingView()
            : Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.background))),
                child: SafeArea(
                    child: Form(
                  key: model.registerKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          alignment: Alignment.centerLeft,
                          child: Image.asset(ImageConstants.starTitle)),
                      textField(
                          textfieldModel: TextfieldModel(
                              phoneHeight: phoneHeight,
                              phoneWidth: phoneWidth,
                              label: 'Email',
                              isHidden: true)),
                      textField(
                        textfieldModel: TextfieldModel(
                            phoneHeight: phoneHeight,
                            phoneWidth: phoneWidth,
                            label: 'Password',
                            isHidden: model.isHidden),
                      ),
                      textField(
                        textfieldModel: TextfieldModel(
                            phoneHeight: phoneHeight,
                            phoneWidth: phoneWidth,
                            label: 'Full Name',
                            isHidden: true),
                      ),
                      textField(
                        textfieldModel: TextfieldModel(
                            phoneHeight: phoneHeight,
                            phoneWidth: phoneWidth,
                            label: 'Phone Number',
                            isHidden: true),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            model.error,
                            style: const TextStyle(color: AppColorScheme.error),
                          )),
                      registerButton(phoneWidth, context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? ",
                              style: TextStyle(
                                  color: AppColorScheme.mainAppDarkerGrey)),
                          clickableText('Sign in', widget.toggle),
                        ],
                      )
                    ],
                  ),
                )),
              ));
  }

  Widget textField({required TextfieldModel textfieldModel}) {
    Widget visibilityIcon = SvgPicture.asset(ImageConstants.visibilityIcon);
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: SizedBox(
            width: textfieldModel.phoneWidth * 0.9,
            child: TextFormField(
                inputFormatters: textfieldModel.label == 'Phone Number'
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : null,
                keyboardType: textfieldModel.label == 'Phone Number'
                    ? TextInputType.number
                    : null,
                validator: (val) => model.validator(textfieldModel.label, val!),
                obscureText: textfieldModel.label == "Password"
                    ? textfieldModel.isHidden
                    : textfieldModel.isHidden == false,
                onChanged: (val) {
                  setState(() {
                    model.onChanged(val, textfieldModel.label);
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

  Widget registerButton(double phoneWidth, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      width: phoneWidth * 0.9,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (model.registerKey.currentState!.validate()) {
            setState(() {
              model.isLoading = true;
            });
          }
          await model.register();
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.mainAppGreen,
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
      child: Text(label,
          style: const TextStyle(color: AppColorScheme.mainAppDarkerGrey)),
    );
  }
}
