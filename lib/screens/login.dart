import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/register.dart';
import 'package:firebase_demo/services/authentication.dart';
import 'package:firebase_demo/theme/size_config.dart';
import 'package:firebase_demo/widgets/auth_button.dart';
import 'package:firebase_demo/widgets/auth_form_field.dart';
import 'package:firebase_demo/widgets/auth_question.dart';
import 'package:firebase_demo/widgets/auth_scaffold.dart';
import 'package:firebase_demo/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBarTitle: "Giriş Yap",
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(44)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(14)),
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
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
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
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
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
                    AuthFormField(
                      textEditingController: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
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
                  AuthFormField(
                    textEditingController: passwordController,
                    obscure: true,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50), bottom: getProportionateScreenHeight(4)),
                child: AuthButton(
                  buttonText: 'Giriş Yap',
                  onPressed: () {
                    _authenticationService.login(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                        );
                  },
                ),
              ),
              AuthQuestion(
                questionText: "Bir hesabın yok mu?",
                buttonText: "Kayıt Ol.",
                nextRoute: RegisterScreen(),
                exitRoute: this.widget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
