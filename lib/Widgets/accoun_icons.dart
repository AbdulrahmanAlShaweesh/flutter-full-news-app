// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';

class AccountIcons extends StatelessWidget {
  AccountIcons(
      {super.key,
      required this.mediaImage,
      required this.labelText,
      required this.heigh});

  String mediaImage;
  String labelText;
  double heigh;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, 10.0),
              blurRadius: 12.0)
        ],
        color: Color(0xFFecf0f3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(mediaImage, width: heigh),
          SizedBox(
            width: 6.0,
          ),
          Text(
            labelText,
            style: TextStyle(
              color: AppColors().kPrmaryColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
