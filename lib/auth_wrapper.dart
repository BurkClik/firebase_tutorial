import 'package:firebase_demo/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatefulWidget {
  static String routeName = 'authWrapper';

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  SharedPreferences sharedPreferences;

  _checkAuthStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("checkAuthStatus"));
    if (sharedPreferences.getString("checkAuthStatus") == null) {
      Navigator.of(context).popAndPushNamed("welcome");
    } else {
      Navigator.of(context).popAndPushNamed("home");
    }
  }

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}
