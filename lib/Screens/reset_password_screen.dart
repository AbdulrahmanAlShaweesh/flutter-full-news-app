// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, empty_catches

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/otp_reset_password_screen.dart';
import 'package:news_app/Screens/user_country_selection.dart';
import 'package:news_app/Widgets/big_text.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/custom_error_message.dart';
import 'package:news_app/Widgets/custom_text_field.dart';
import 'package:news_app/Widgets/small_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  static String id = 'reset password using emial screen';
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKem = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String resetMethod = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Form(
          key: formKem,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    colors: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    text: 'Forgot',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  BigText(
                    colors: AppColors().kAcceoryColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    text: 'Verification',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: 'Don\'t worry! it happens. please enter the',
                        fonsSize: 16.0,
                        colors: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      SmallText(
                        text:
                            '${resetMethod == "emial" ? 'emial' : 'mobile number'} associated with your account',
                        fonsSize: 16.0,
                        colors: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SmallText(
                    text: resetMethod == 'emial'
                        ? 'Emial Address Verification ID '
                        : 'Mobile Number Verification',
                    fonsSize: 16.0,
                    colors: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormFied(
                    textInputType: resetMethod == 'emial'
                        ? TextInputType.emailAddress
                        : TextInputType.phone,
                    hintText: resetMethod == 'emial'
                        ? 'Emial address'
                        : 'Mobile Number',
                    icons: resetMethod == 'emial' ? Icons.email : Icons.sms,
                    isPassword: false,
                    validator: (data) {
                      if (resetMethod == 'emial') {
                        if (data!.isEmpty) {
                          return 'emial is requred';
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(data) !=
                            true) {
                          return 'invalid emial structues';
                        }
                      } else {
                        if (data == null || data.isEmpty) {
                          return 'emial is requred';
                        }
                        if (RegExp(r"[A-Z]").hasMatch(data) == true ||
                            RegExp(r"[a-z]").hasMatch(data) == true) {
                          return 'phone numbers should be a numbers only';
                        }

                        if (RegExp(r"^[.!#$%&'*+-/=?^_`{|}~]").hasMatch(data)) {
                          return 'phone numbers should be a numbers ';
                        }
                        if (data.length < 11 || data.length > 11) {
                          return 'phone number should be 11 numbers';
                        }
                      }
                      return null;
                    },
                    controller: controller,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: CustomButtom(
                  text: 'Submit',
                  onTap: () {
                    if (formKem.currentState!.validate()) {
                      try {
                        if (resetMethod == 'emial') {
                          Navigator.pushNamed(
                            context,
                            CountrySelectionScreen.id,
                          );
                          CustomErrorMessage(
                              context, 'verfication code send to your emial');
                        } else {
                          Navigator.pushNamed(context, OTPScreen.id);
                          CustomErrorMessage(
                              context, 'verfication code send to your number');
                        }
                        controller.clear();
                      } catch (err) {}
                    }
                  },
                  heigh: 53.0,
                  colors: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
