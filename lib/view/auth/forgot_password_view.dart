import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/auth/forgot_password_view_model.dart';
import 'package:coffee/view/loader_view.dart';
import 'package:coffee/view/order_detail/order_detail_view.dart';
import 'package:flutter/material.dart';
import '../../product/constants/color_scheme.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordViewModel model = ForgotPasswordViewModel();
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: model.isLoading
            ? null
            :AppBar(
            leading: IconButton(
                alignment: Alignment.center,
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            iconTheme:
                const IconThemeData(color: AppColorScheme.mainAppDarkGreen),
            title: const Text(
              'Forgot Password',
              style: TextStyle(color: AppColorScheme.mainAppDarkGreen),
            )),
        body: model.isLoading
            ? const LoadingView()
            : Container(
                width: phoneWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.background))),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20) +
                              const EdgeInsets.only(bottom: 20, top: 5),
                          child: const Text(
                            "Enter your email we'll send you a link to reset your password",
                            style: TextStyle(
                              color: AppColorScheme.mainAppDarkerGrey,
                              fontSize: 16,
                            ),
                          )),
                      Form(
                          key: model.forgotKey,
                          child: textField(phoneWidth, model)),
                      resetButton(phoneWidth, context)
                    ],
                  ),
                ),
              ));
  }

  Widget textField(double phoneWidth, ForgotPasswordViewModel model) {
    return SizedBox(
        width: phoneWidth * 0.9,
        child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Enter an email' : null,
            onChanged: (val) {
              setState(() {
                model.onChanged(val);
              });
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle:
                  TextStyle(color: AppColorScheme.lightGrey, fontSize: 20),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColorScheme.lightGrey)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColorScheme.lightGrey)),
            )));
  }

  Widget resetButton(double phoneWidth, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: phoneWidth * 0.9,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (model.forgotKey.currentState!.validate()) {
            setState(() {
              model.isLoading = true;
            });
          }
          await model.reset(context);
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.mainAppGreen,
        ),
        child: const Center(child: Text('Reset Password')),
      ),
    );
  }
}
