import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColorScheme.mainAppDarkGreen,
      child:  Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(ImageConstants.background),
            const SpinKitPulse(
              duration: Duration(seconds: 2),
              color: Colors.white,
              size: 300,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.asset(ImageConstants.logo,alignment: Alignment.center,),
            ),
          ],
        ),
      ),
    );
  }
}
