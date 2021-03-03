import 'package:flutter/material.dart';
import 'package:marcusng_fb_signin_login/screens/login_screen.dart';
import 'package:marcusng_fb_signin_login/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SignIn / LogIn Demo',
        home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen()
        });
  }
}
