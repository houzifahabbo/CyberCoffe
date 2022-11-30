import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/color_scheme.dart';

PreferredSizeWidget mainAppBar(String title){
  return AppBar(
      backgroundColor: Colors.white,
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
        icon: Image.asset(ImageConstants.menuIcon),
      ),
    ],
  );
}
