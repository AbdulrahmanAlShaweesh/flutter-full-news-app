// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {super.key,
      required this.text,
      required this.fonsSize,
      required this.colors,
      required this.fontWeight});

  String text;
  double fonsSize;
  Color colors;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fonsSize,
          color: colors,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
