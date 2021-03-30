import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  /// [email] ve [password]
  Future<String> signUp(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Kayıt olma başarılı';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Hesap zaten var', textAlign: TextAlign.center,),
            backgroundColor: Color(0xFF6A040F),
          ),
        );
        return 'The account already exists for that email';
      }
    } catch (e) {
      return e.message;
    }
  }

  Future<String> login(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).popAndPushNamed("home");
      return 'Giriş yapıldı';
    } catch (e) {
      return e.message;
    }
  }

  Future<String> logout(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
      return 'Çıkış yapıldı';
    } catch (e) {
      return e.message;
    }
  }
}
