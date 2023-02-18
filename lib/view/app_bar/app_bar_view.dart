import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/app_bar/app_bar_view_model.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/color_scheme.dart';

final AppBarViewModel model = AppBarViewModel();

PreferredSizeWidget mainAppBarWithLeading(String title,BuildContext context) {
  return AppBar(
    leading: IconButton(
      alignment: Alignment.center,
        icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20,),
        onPressed: () {
          Navigator.pop(context);
        }),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
        color: AppColorScheme.mainAppDarkGreen
    ),
    title: Text(title,
      style: const TextStyle(
          color: AppColorScheme.mainAppDarkGreen),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Image.asset(ImageConstants.notificationsIcon),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.logout_outlined),
      ),
    ],
  );
}
PreferredSizeWidget mainAppBar(String title){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: AppColorScheme.mainAppDarkGreen
    ),
    title: Text(title,
      style: const TextStyle(
          color: AppColorScheme.mainAppDarkGreen),
    ),
    actions: [
      // IconButton(
      //   onPressed: () {},
      //   icon: Image.asset(ImageConstants.notificationsIcon),
      // ),
      IconButton(
        onPressed: () {
          model.logout();
        },
        icon: const Icon(Icons.logout_outlined),
      ),
    ],
  );
}