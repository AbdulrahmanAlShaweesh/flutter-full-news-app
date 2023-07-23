// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Widgets/big_text.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/small_text.dart';

class StareUsingApp extends StatelessWidget {
  StareUsingApp({super.key});

  static String id = 'start using app screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 150,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/Frame222.png',
                        color: AppColors().kAcceoryColor,
                      ),
                    ),
                    BigText(
                      colors: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      text: 'Congratulations!',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SmallText(
                      text: 'your account ready to use!',
                      fonsSize: 16.0,
                      colors: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                    ),
                    // SizedBox(
                    //   height: 140.0,
                    // ),
                    // Expanded(child: SizedBox()),
                  ],
                ),
              ),
              CustomButtom(
                text: 'Go to home page',
                onTap: () {},
                heigh: 45.0,
                colors: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
