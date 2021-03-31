import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget body;
  final String appBarTitle;

  const AuthScaffold({Key key, this.body, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03071E),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBarText,
        leading: appBarIconButton(context),
      ),
      body: body,
    );
  }

  IconButton appBarIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left,
        size: 40,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Text get appBarText => Text(
        appBarTitle,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        ),
      );
}
