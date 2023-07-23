// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCheckedBox extends StatefulWidget {
  const CustomCheckedBox({super.key});

  @override
  State<CustomCheckedBox> createState() => _CustomCheckedBoxState();
}

class _CustomCheckedBoxState extends State<CustomCheckedBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 9, bottom: 10),
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: isChecked == true ? Colors.blue : Color(0xFFc5c5c5),
              borderRadius: BorderRadius.circular(
                3.0,
              ),
            ),
            child: isChecked == true
                ? Icon(
                    Icons.check,
                    size: 20.0,
                    color: isChecked == true ? Colors.white : null,
                  )
                : SizedBox.shrink(),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            'Remember me',
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xFFc5c5c5),
            ),
          ),
        ],
      ),
    );
  }
}
