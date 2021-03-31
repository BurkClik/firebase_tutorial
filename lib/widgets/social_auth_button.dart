import 'package:firebase_demo/theme/size_config.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String iconName;
  final Function onPressed;

  const SocialAuthButton({Key key, this.iconName, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: customButtonIcon,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF101010),
        side: BorderSide(
          color: Color(0xFF343434),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: Size(getProportionateScreenHeight(160), getProportionateScreenWidth(60)),
      ),
    );
  }

  Image get customButtonIcon => Image.asset(
        "assets/images/$iconName.png",
        width: getProportionateScreenWidth(36),
        height: getProportionateScreenHeight(36),
      );
}
