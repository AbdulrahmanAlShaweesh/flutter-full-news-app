// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    required this.text,
    required this.onTap,
    required this.heigh,
    required this.colors,
  });

  String text;
  VoidCallback onTap;
  double heigh;
  Color colors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: heigh,
        decoration: BoxDecoration(
          color: AppColors().kAcceoryColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            color: colors,
          ),
        ),
      ),
    );
  }
}
