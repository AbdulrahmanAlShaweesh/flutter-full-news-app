// ignore_for_file: prefer_const_constructors, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class CustomTextFormFied extends StatelessWidget {
  CustomTextFormFied({
    super.key,
    required this.hintText,
    required this.icons,
    this.suffixIcon,
    this.suffixIconOnPress,
    required this.isPassword,
    required this.validator,
    required this.controller,
    required this.textInputType,
  });

  String hintText;
  IconData icons;
  IconData? suffixIcon;
  VoidCallback? suffixIconOnPress;
  bool isPassword;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      style: TextStyle(
        fontSize: 16.0,
        color: Color(0xFFc5c5c5),
        letterSpacing: 0.1,
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: suffixIconOnPress,
          child: Icon(
            suffixIcon,
            color: Color(0xFFc5c5c5),
          ),
        ),
        prefixIcon: Icon(
          icons,
          color: Color(0xFFc5c5c5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 18.0, color: Color(0xFFc5c5c5), letterSpacing: 0.1),
        fillColor: Color(
          0xFF3a3b3c,
        ),
        filled: true,
      ),
    );
  }
}
