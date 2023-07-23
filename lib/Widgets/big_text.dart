// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.colors,
    required this.fontSize,
    required this.fontWeight,
    required this.text,
  });
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: colors,
        fontWeight: fontWeight,
      ),
    );
  }
}
