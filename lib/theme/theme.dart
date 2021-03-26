import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  );
}