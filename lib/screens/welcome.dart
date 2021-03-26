import 'package:firebase_demo/animations/animation_route.dart';
import 'package:firebase_demo/screens/login.dart';
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
            padding: EdgeInsets.only(left: 36.0, right: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 48.0, bottom: 24.0),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
                buildText('Enjoy the trip'),
                buildText('with me'),
                SizedBox(
                  height: 280,
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
                  height: 24,
                ),
                buildElevatedButton(
                  buttonColor: Color(0xFFFFBA08),
                  buttonText: 'Kayıt Ol',
                  onPressed: () {
                    print("Kayıt Ol");
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
        minimumSize: Size(double.infinity, 60),
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
