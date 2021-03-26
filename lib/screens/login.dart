import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03071E),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Giriş Yap",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
          onPressed: () => Navigator.popAndPushNamed(context, "welcome"),
        ),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
