import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/widgets/auth_button.dart';
import 'package:firebase_demo/widgets/auth_form_field.dart';
import 'package:firebase_demo/widgets/auth_question.dart';
import 'package:firebase_demo/widgets/auth_scaffold.dart';
import 'package:firebase_demo/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "register";

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBarTitle: "Kayıt Ol",
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
                  "Bunlardan birisiyle kayıt olabilirsiniz.",
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
                    SocialAuthButton(
                      iconName: "google",
                    ),
                    SocialAuthButton(
                      iconName: "facebook",
                    ),
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
                padding: EdgeInsets.only(top: 50, bottom: 4),
                child: AuthButton(
                  buttonText: 'Kayıt Ol',
                  onPressed: () {
                    print("H");
                  },
                ),
              ),
              AuthQuestion(
                questionText: "Zaten bir hesabın mı var?",
                buttonText: "Giriş Yap.",
                nextRoute: LoginScreen(),
                exitRoute: this,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
