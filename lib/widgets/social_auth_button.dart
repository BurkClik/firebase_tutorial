import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.snooze),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF101010),
        side: BorderSide(
          color: Color(0xFF343434),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: Size(124, 60),
      ),
    );
  }
}