import 'package:firebase_demo/animations/animation_route.dart';
import 'package:flutter/material.dart';

class AuthQuestion extends StatelessWidget {
  final String buttonText;
  final String questionText;
  final Widget exitRoute;
  final Widget nextRoute;

  const AuthQuestion(
      {Key key,
      this.buttonText,
      this.questionText,
      this.nextRoute,
      this.exitRoute})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customQuestionText,
        customTextButton(context),
      ],
    );
  }

  TextButton customTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          enterExitRoute(exitRoute, nextRoute),
        );
      },
      child: navigateText,
      style: TextButton.styleFrom(
        primary: Color(0xFFE85D04),
      ),
    );
  }

  Text get navigateText => Text(
        buttonText,
        style: TextStyle(
            fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w700),
      );

  Text get customQuestionText => Text(
        questionText,
        style: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontFamily: 'Lato',
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      );
}
