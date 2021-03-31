import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/regex.dart';
import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/services/authentication.dart';
import 'package:firebase_demo/theme/size_config.dart';
import 'package:firebase_demo/widgets/auth_button.dart';
import 'package:firebase_demo/widgets/auth_form_field.dart';
import 'package:firebase_demo/widgets/auth_question.dart';
import 'package:firebase_demo/widgets/auth_scaffold.dart';
import 'package:firebase_demo/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBarTitle: "Kayıt Ol",
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
                padding: EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialAuthButton(
                      iconName: "google",
                      onPressed: () {},
                    ),
                    SocialAuthButton(
                      iconName: "facebook",
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bu alanı boş bırakamazsınız';
                              } else if (!emailRegex.hasMatch(value)) {
                                return 'Geçerli bir mail adresi giriniz.';
                              }
                              return null;
                            },
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Parola boş bırakılamaz';
                            } else if (!passwordRegex.hasMatch(value)) {
                              return 'Parolanız minimum 6 karakterden oluşmalı\nve en az bir harf ve sayı içermeli.';
                            }
                            return null;
                          },
                          obscure: showPassword,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Parola Doğrula",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AuthFormField(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Parola ile eşleşmiyor';
                              }
                              return null;
                            },
                            obscure: showPassword,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50), bottom: getProportionateScreenHeight(4)),
                child: AuthButton(
                  buttonText: 'Kayıt Ol',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _authenticationService.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                    }
                  },
                ),
              ),
              AuthQuestion(
                questionText: "Zaten bir hesabın mı var?",
                buttonText: "Giriş Yap.",
                nextRoute: LoginScreen(),
                exitRoute: this.widget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
