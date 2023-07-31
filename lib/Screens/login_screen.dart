// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unused_catch_clause, unused_local_variable, empty_catches, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Screens/reset_password_method.dart';
import 'package:news_app/Screens/register_Screen.dart';
import 'package:news_app/Screens/user_country_selection.dart';
import 'package:news_app/Services/auth_services.dart';
import 'package:news_app/Widgets/accoun_icons.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/custom_checked_box.dart';
import 'package:news_app/Widgets/custom_error_message.dart';
import 'package:news_app/Widgets/custom_text_field.dart';
import 'package:news_app/Widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheckedPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: 150,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/Frame222.png',
                        color: Color(0xFFc5c5c5),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    SmallText(
                      text: 'Welcome back!',
                      fonsSize: 20.0,
                      colors: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.emailAddress,
                      controller: emialController,
                      validator: (data) {
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(data!) !=
                            true) {
                          return 'invalid emial structues';
                        }
                        if (data.isEmpty) {
                          return 'emial is requred';
                        }
                        return null;
                      },
                      isPassword: false,
                      icons: Icons.email,
                      hintText: 'Enter your emial',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.text,
                      controller: passwordController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'emial is requred';
                        }
                        if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])')
                                .hasMatch(data) !=
                            true) {
                          return 'invalid password strucure';
                        }
                        return null;
                      },
                      isPassword: isCheckedPassword,
                      suffixIconOnPress: () {
                        setState(() {
                          isCheckedPassword = !isCheckedPassword;
                        });
                      },
                      suffixIcon: isCheckedPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      icons: Icons.lock,
                      hintText: 'Enter your password',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckedBox(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ResetPaasordMethod.id);
                            },
                            child: Text(
                              'Forgor Password?',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: AppColors().kAcceoryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomButtom(
                      colors: Color(0xFFc5c5c5),
                      heigh: 45.0,
                      text: 'LOGIN',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await Authintications.login(
                              emial: emialController.text.trim(),
                              password: passwordController.text.trim(),
                              context: context,
                            );
                          } on FirebaseAuthException catch (err) {}

                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        )),
                        Text("OR",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AccountIcons(
                          heigh: 25.0,
                          labelText: 'Facebook',
                          mediaImage: 'assets/facebook.png',
                        ),
                        AccountIcons(
                          heigh: 25.0,
                          labelText: 'Google',
                          mediaImage: 'assets/google.png',
                        ),
                        AccountIcons(
                          heigh: 25.0,
                          labelText: 'Apple',
                          mediaImage: 'assets/apple.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFFc5c5c5),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.id,
                            );
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: AppColors().kAcceoryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
