import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscure;
  final Function validator;
  final TextInputType keyboardType;
  final Widget suffixIcon;

  const AuthFormField(
      {this.textEditingController,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      obscure})
      : obscure = obscure ?? false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: textEditingController,
      obscureText: obscure,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF101010),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFF343434),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFFFFBA08),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
    );
  }
}
