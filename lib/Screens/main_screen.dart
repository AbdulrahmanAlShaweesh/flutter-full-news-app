// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/get_started_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  static String id = 'main screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, GetStartedScreen.id);
                },
                child: Image.asset('assets/Frame222.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
