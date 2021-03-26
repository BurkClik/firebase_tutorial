import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String iconName;

  const SocialAuthButton({Key key, this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: customButtonIcon,
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

  Image get customButtonIcon => Image.asset(
        "assets/images/$iconName.png",
        width: 28,
        height: 28,
      );
}
