import 'package:coffee/view/order/order_view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/home/view/home_view.dart';
import 'package:coffee/view/auth/login/view/login_view.dart';
import 'package:coffee/view/view_model/bottom_nav_bar/bottom_nav_bar_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Values(),
    }
    );
  }
}
class Values extends StatelessWidget {
  const Values({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/bottom': (context) => MainBottomNavBar(selectedIndex: 1),
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/order': (context) => const OrderView(),
        }
    );
  }
}
