// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/login_screen.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/small_text.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});

  static String id = 'get started screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Image.asset(
                'assets/started_screen_image.jpg', fit: BoxFit.cover,
                // height: 300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                SmallText(
                  text: 'Let\'s get started',
                  fonsSize: 18.0,
                  colors: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.0,
                ),
                SmallText(
                  text: 'start searchs latiest news now',
                  fonsSize: 18.0,
                  colors: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButtom(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              heigh: 45,
              colors: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
