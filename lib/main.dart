import 'package:coffee/models/user.dart';
import 'package:coffee/view/auth/login/service/login_service.dart';
import 'package:coffee/view/auth/login/view/warpper.dart';
import 'package:coffee/view/bottom_nav_bar/bottom_nav_bar_view/bottom_nav_bar_view.dart';
import 'package:coffee/view/order_complete/order_complete_view.dart';
import 'package:coffee/view/order_detail/order_detail_view.dart';
import 'package:coffee/view/order_select/order_select_view/order_select_view.dart';
import 'package:flutter/material.dart';
import 'package:coffee/view/home/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return StreamProvider<UserFb?>.value(
      initialData: null,
      value: LoginService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/wrapper',
          routes: {
            '/wrapper': (context)=> const Wrapper(),
            '/bottom': (context) => MainBottomNavBar(),
            //'/login': (context) =>  LoginView(t),
            '/home': (context) => const HomeView(),
            '/order': (context) => const OrderView(),
            '/orderDetail':(context)=> const OrderDetailView(),
            //'/productDetail':(context) => const ProductDetailView(),
            '/orderComplete':(context) => const OrderCompleteView(),
          }
      ),
    );
  }
}
