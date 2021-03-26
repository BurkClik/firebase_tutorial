import 'package:firebase_demo/animations/animation_route.dart';
import 'package:flutter/material.dart';

class AuthQuestion extends StatelessWidget {
  final String buttonText;
  final String questionText;
  final Widget nextRoute;

  const AuthQuestion({Key key, this.buttonText, this.questionText, this.nextRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontFamily: 'Lato',
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(enterExitRoute(this, nextRoute),);
          },
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w700),
          ),
          style: TextButton.styleFrom(
            primary: Color(0xFFE85D04),
          ),
        ),
      ],
    );
  }
}
