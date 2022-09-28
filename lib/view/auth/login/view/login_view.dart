import 'package:coffee/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

///The design should be on this page. Widgets should be split.
///I have to reach events like click by saying model.blabla

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Stack(
      children:[
        Scaffold(
            backgroundColor: Color(0xfff7f8fa),
            body:  SafeArea(
              child:
              Padding(
                padding: EdgeInsets.only(left: phoneWidth*0.05,top: phoneHeight*0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/starbucks.png'),
                      Padding(
                        padding:EdgeInsets.only(top: phoneHeight*0.02),
                        child: const Text(
                          'Welcome back!',
                          style: TextStyle(
                              fontSize: 35,
                              color: Color(0xFF2e2d38),
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: phoneHeight*0.02),
                        child: const Text(
                          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit sed do eiusmod tempor',
                          style: TextStyle(
                              color: Color(0xff4d5661),
                              fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: phoneHeight*0.03),
                        child: const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.red,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            )
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: phoneHeight*0.02),
                        child: const TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            )),
                      ),
                     Padding(
                          padding:EdgeInsets.only(top: phoneHeight*0.05 ,left: phoneWidth*0.55),
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                                color: Color(0xff4d5661)
                            ),
                          ),
                        ),

                      Padding(
                        padding:EdgeInsets.only(top: phoneHeight*0.05),
                        child: ElevatedButton(
                          onPressed: (){},
                          style:  const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff4aa366)),
                          ),
                          child: Text('Login'),
                        ),

                      )
                    ]),
              ),
            )
        ),
        Image.asset('assets/background.png'),
    ]);
  }
}
