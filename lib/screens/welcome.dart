import 'package:firebase_demo/animations/animation_route.dart';
import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/screens/register.dart';
import 'package:firebase_demo/theme/size_config.dart';
import 'package:flutter/material.dart';

// TODO: Responsive olarak düzenle!
class WelcomeScreen extends StatelessWidget {
  static String routeName = "welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(36)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getProportionateScreenHeight(48), bottom: getProportionateScreenHeight(24)),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
                buildText('Enjoy the trip'),
                buildText('with me'),
                SizedBox(
                  height: getProportionateScreenHeight(280),
                ),
                buildElevatedButton(
                    buttonColor: Color(0xFF03071E),
                    buttonText: 'Giriş Yap',
                    onPressed: () {
                      Navigator.of(context).push(
                        enterExitRoute(
                          this,
                          LoginScreen(),
                        ),
                      );
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                buildElevatedButton(
                  buttonColor: Color(0xFFFFBA08),
                  buttonText: 'Kayıt Ol',
                  onPressed: () {
                    Navigator.of(context).push(
                      enterExitRoute(
                        this,
                        RegisterScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO: Fonksiyona default değer atamaya bak
  ElevatedButton buildElevatedButton(
      {Color buttonColor, String buttonText, Function onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: Size(double.infinity, getProportionateScreenWidth(54)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 2.0,
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
