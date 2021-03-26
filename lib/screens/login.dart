import 'package:firebase_demo/screens/register.dart';
import 'package:firebase_demo/widgets/auth_button.dart';
import 'package:firebase_demo/widgets/auth_form_field.dart';
import 'package:firebase_demo/widgets/auth_question.dart';
import 'package:firebase_demo/widgets/social_auth_button.dart';
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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Text(
                  "Bunlardan biriyle giriş yapabilirsiniz.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialAuthButton(),
                    SocialAuthButton(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AuthFormField(),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Parola",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AuthFormField(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 12),
                child: AuthButton(
                  buttonText: 'Giriş Yap',
                  onPressed: () {
                    print("H");
                  },
                ),
              ),
              AuthQuestion(
                questionText: "Bir hesabın yok mu?",
                buttonText: "Kayıt Ol.",
                nextRoute: RegisterScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
