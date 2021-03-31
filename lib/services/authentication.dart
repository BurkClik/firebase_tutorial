import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Future<String> signUp(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Kullanıcının authStatus'unu kontrol etmek için
      // İşlem başarılıysa local storage'a kullanıcının logged
      // olduğu bilgisi kaydediliyor.
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("checkAuthStatus", "logged");

      // İşlem başarılıysa kullanıcı Home sayfasına yönlendiriliyor.
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);

      return 'signUp has been successful';
    } on FirebaseAuthException catch (e) {
      // Kayıt olunmaya çalışılan mail adresi veritabanında varsa
      // kullanıcıya hata döndürülüyor.
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Hesap zaten var',
              textAlign: TextAlign.center,
            ),
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
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("checkAuthStatus", "logged");
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      return 'Successfully logged in';
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      // Giriş yapılmaya çalışılan hesabın şifresi yanlışsa
      // kullanıcaya hata döner
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Yanlış şifre girdiniz",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color(0xFF6A040F),
          ),
        );
      }
      // Giriş yapılan mail adresi kayıtlı değilse
      // kullanıcıya hata döner
      else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Kullanıcı bulunamadı. Lütfen kayıt olunuz.",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color(0xFF6A040F),
          ),
        );
      }
      return e.message;
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
