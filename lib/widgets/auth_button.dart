import 'package:firebase_demo/theme/size_config.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const AuthButton({Key key, this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: customButtonText,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Color(0xFF6A040F),
          minimumSize: Size(double.infinity, getProportionateScreenWidth(54)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }

  Text get customButtonText => Text(
        buttonText,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
      );
}
