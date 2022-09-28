import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coffee/view/auth/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme:  ElevatedButtonThemeData(
            style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4aa366),
              //TODO public height and width
              padding: EdgeInsets.symmetric(vertical:20, horizontal: 168),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginView(),
        }
        );
  }
}