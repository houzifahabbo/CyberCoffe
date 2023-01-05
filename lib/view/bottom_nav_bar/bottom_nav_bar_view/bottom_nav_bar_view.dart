import 'package:coffee/view/bottom_nav_bar/bottom_nav_bar_view_model/bottom_nav_bar_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/color_scheme.dart';

class MainBottomNavBar extends StatefulWidget {
  MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int selectedIndex=0;
  BottomNavBarViewModel model = BottomNavBarViewModel();
    PageController controller = PageController(
      initialPage: 0,
      keepPage: true,
    );
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
                    offset: const Offset(0, 8),
                    color: AppColorScheme.shadow.withOpacity(0.3),
                    blurRadius: 25
                )
              ],
              color: Colors.white
          ),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              showUnselectedLabels: false,
              items: model.bottomNavList,
              onTap: onItemTapped,
          ),
        ),
        body: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: onPageChanged,
            children: model.pages
        )
    );
  }
    void onPageChanged(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    void onItemTapped(int index) {
      selectedIndex = index;
      controller.animateToPage(
          index, duration: const Duration(milliseconds: 500),
          curve: Curves.ease);
    }
}
  BottomNavigationBarItem bottomNavBarItemsGetter(icon) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon),
      label: '',
      activeIcon: Image.asset(
        icon,
        color: AppColorScheme.mainAppGreen,
      ),
    );
  }
