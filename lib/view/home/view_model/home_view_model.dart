import 'package:coffee/product/constants/image_constants.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/color_scheme.dart';

class HomeViewModel {

  List<BottomNavigationBarItem> bottomNavList = [
    BottomNavigationBarItem(
        icon:Image.asset(ImageConstants.starIcon),
        activeIcon: Image.asset('assets/icons/bottom_navigation_bar/home_page.png',color: AppColorScheme.mainAppGreen,),
        label: ''
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/icons/bottom_navigation_bar/order_page.png'),
        activeIcon: Image.asset('assets/icons/bottom_navigation_bar/order_page.png',color: AppColorScheme.mainAppGreen,),
        label: ''
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/icons/bottom_navigation_bar/card_page.png'),
        activeIcon: Image.asset('assets/icons/bottom_navigation_bar/card_page.png',color: AppColorScheme.mainAppGreen,),
        label: ''
    ),
    BottomNavigationBarItem(
        icon: Image.asset('assets/icons/bottom_navigation_bar/location_page.png'),
        activeIcon: Image.asset('assets/icons/bottom_navigation_bar/location_page.png',color: AppColorScheme.mainAppGreen,),
        label: ''
    ),
  ];
}