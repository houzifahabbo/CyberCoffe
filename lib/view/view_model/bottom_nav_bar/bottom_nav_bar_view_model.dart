import 'package:coffee/product/constants/image_constants.dart';
import 'package:coffee/view/home/view/home_view.dart';
import 'package:coffee/view/order/order_view/order_view.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/color_scheme.dart';

class MainBottomNavBar extends StatefulWidget {
  int selectedIndex;
  MainBottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset:const Offset(0,8),
                color: AppColorScheme.shadow.withOpacity(0.3),
                blurRadius: 25
            )],
            color: Colors.white
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.selectedIndex,
            showUnselectedLabels: false,
            items: bottomNavList,
            onTap: _onItemTapped,
          ),
        ),
        body: pages.elementAt(widget.selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  List<Widget> pages = const [
    HomeView(),
    OrderView(),
    HomeView(),
    OrderView(),
  ];

  List<BottomNavigationBarItem> bottomNavList = [
    bottomNavBarItemsGetter(ImageConstants.starIcon),
    bottomNavBarItemsGetter(ImageConstants.cupIcon),
    bottomNavBarItemsGetter(ImageConstants.cardIcon),
    bottomNavBarItemsGetter(ImageConstants.locationIcon)
  ];
}

BottomNavigationBarItem bottomNavBarItemsGetter(icon) {
  return BottomNavigationBarItem(
      icon: Image.asset(icon),
      activeIcon: Image.asset(
        icon,
        color: AppColorScheme.mainAppGreen,
      ),
      label: '');
}
