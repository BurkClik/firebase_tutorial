import 'package:firebase_demo/routes.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:firebase_demo/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
