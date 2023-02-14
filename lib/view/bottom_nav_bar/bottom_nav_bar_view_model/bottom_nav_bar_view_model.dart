import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/home/view/home_view.dart';
import 'package:coffee/view/order_select/order_select_view/order_select_view.dart';
import 'package:coffee/view/product_detial/view/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/bottom_nav_bar/bottom_nav_bar_view/bottom_nav_bar_view.dart';


class BottomNavBarViewModel{

  List<Widget> pages = const [
    HomeView(),
    OrderView(),
    OrderView(),
    OrderView(),
  ];

  List<BottomNavigationBarItem> bottomNavList = [
    bottomNavBarItemsGetter(ImageConstants.starIcon),
    bottomNavBarItemsGetter(ImageConstants.cupIcon),
    bottomNavBarItemsGetter(ImageConstants.cardIcon),
    bottomNavBarItemsGetter(ImageConstants.locationIcon)
  ];
}