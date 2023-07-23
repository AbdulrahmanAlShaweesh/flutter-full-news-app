// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/account_Ready_to_use_screen.dart';
import 'package:news_app/Widgets/big_text.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/custom_error_message.dart';
import 'package:news_app/Widgets/small_text.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  static String id = 'OTP screen';

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpValue;
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // height: 150,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/Frame222.png',
                  color: Color(0xFFc5c5c5),
                ),
              ),
              BigText(
                colors: Colors.white.withOpacity(0.4),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                text: 'Reset Password',
              ),
              SizedBox(
                height: 15.0,
              ),
              SmallText(
                text: 'Enter the OTP send to your phone number',
                fonsSize: 14,
                colors: Colors.white.withOpacity(0.4),
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 15.0,
              ),
              Pinput(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                controller: controller,
                showCursor: true,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 50.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                onSubmitted: (pinNumber) {
                  setState(() {
                    otpValue = pinNumber;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtom(
                text: 'verfiy',
                onTap: () {
                  if (controller.length < 6) {
                    CustomErrorMessage(context, 'enter 6-digits number');
                    log(controller.text.trim());
                  } else {
                    CustomErrorMessage(
                        context, 'password reseted successfully');
                    log(controller.text.trim());
                    Navigator.pushNamed(
                      context,
                      StareUsingApp.id,
                    );
                  }
                },
                heigh: 45.0,
                colors: Colors.white,
              ),
              SizedBox(
                height: 15.0,
              ),
              SmallText(
                text: 'Don\'t recive any code',
                fonsSize: 16.0,
                colors: Colors.white.withOpacity(0.4),
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 15.0,
              ),
              SmallText(
                text: 'Resend a new code',
                fonsSize: 16.0,
                colors: Colors.white.withOpacity(0.4),
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
