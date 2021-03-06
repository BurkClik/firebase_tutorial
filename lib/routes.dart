import 'package:firebase_demo/auth_wrapper.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/screens/register.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => Home(),
  AuthWrapper.routeName: (context) => AuthWrapper(),
};
