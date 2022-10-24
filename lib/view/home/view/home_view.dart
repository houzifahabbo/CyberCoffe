import 'package:coffee/product/constants/color_scheme.dart';
import 'package:coffee/view/view_model/app_bar/app_bar_view_model.dart';
import 'package:coffee/view/view_model/bottom_nav_bar/bottom_nav_bar_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.backgroundGrey,
      appBar: mainAppBar("Starbucks"),
    );
  }

}
