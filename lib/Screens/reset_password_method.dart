// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/reset_password_screen.dart';
import 'package:news_app/Widgets/big_text.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/small_text.dart';

class ResetPaasordMethod extends StatefulWidget {
  ResetPaasordMethod({super.key});

  static String id = 'reset password method';

  @override
  State<ResetPaasordMethod> createState() => _ResetPaasordMethodState();
}

class _ResetPaasordMethodState extends State<ResetPaasordMethod> {
  bool isSelectedEmial = true;
  bool isSelectedPhoneNumber = false;
  String? resetPasswordMethod;

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
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      colors: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      text: 'Forgot',
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    BigText(
                      colors: AppColors().kAcceoryColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      text: 'Password?',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'Don\'t worry! it happens. please select the',
                      fonsSize: 16.0,
                      colors: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    SmallText(
                      text: 'emial or phone number associated with',
                      fonsSize: 16.0,
                      colors: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    SmallText(
                      text: 'your account',
                      fonsSize: 16.0,
                      colors: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(
                              //   left: 15.0,
                              // ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors().kAcceoryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: 'via Emial : ',
                                  fonsSize: 16.0,
                                  colors: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SmallText(
                                  text: 'example@youremial.com',
                                  fonsSize: 16.0,
                                  colors: Colors.black,
                                  fontWeight: FontWeight.normal,
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedEmial = !isSelectedEmial;
                              isSelectedPhoneNumber = !isSelectedEmial;
                              log('${isSelectedEmial}');
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(4),
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors().kAcceoryColor,
                                width: 1.8,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: isSelectedEmial
                                ? Icon(
                                    Icons.circle,
                                    size: 20.0,
                                    color: AppColors().kAcceoryColor,
                                  )
                                : SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors().kAcceoryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.sms,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: 'via SMS : ',
                                  fonsSize: 16.0,
                                  colors: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SmallText(
                                  text: '+62-8421-4512-2531',
                                  fonsSize: 16.0,
                                  colors: Colors.black,
                                  fontWeight: FontWeight.normal,
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedPhoneNumber = !isSelectedPhoneNumber;
                              isSelectedEmial = !isSelectedPhoneNumber;
                              log('${isSelectedPhoneNumber}');
                            });
                          },
                          child: Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors().kAcceoryColor,
                                width: 1.8,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: isSelectedPhoneNumber
                                ? Icon(
                                    Icons.circle,
                                    size: 20.0,
                                    color: AppColors().kAcceoryColor,
                                  )
                                : SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomButtom(
              colors: Colors.white,
              heigh: 53.0,
              text: 'Submit',
              onTap: () {
                if (isSelectedEmial) {
                  resetPasswordMethod = 'emial';
                } else {
                  resetPasswordMethod = 'number';
                }
                Navigator.pushNamed(
                  context,
                  ResetPasswordScreen.id,
                  arguments: resetPasswordMethod,
                );
                print(resetPasswordMethod);
              },
            ),
          ],
        ),
      ),
    );
  }
}
