// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable, unused_import, empty_catches, unused_catch_clause, empty_statements, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously, valid_regexps

import 'package:flutter/material.dart';
import 'package:news_app/Constants/constants.dart';
import 'package:news_app/Widgets/accoun_icons.dart';
import 'package:news_app/Widgets/custom_button.dart';
import 'package:news_app/Widgets/custom_error_message.dart';
import 'package:news_app/Widgets/custom_text_field.dart';
import 'package:news_app/Widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static String id = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCheckedPassword = true;
  bool confirmisCheckedPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emialController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conifrmPasswordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('users');
    // double width = ;
    return Scaffold(
      backgroundColor: AppColors().kPrmaryColor,
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
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
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/Frame222.png',
                        color: Color(0xFFc5c5c5),
                      ),
                    ),
                    SmallText(
                      text: 'Sign Up to get stared',
                      fonsSize: 20.0,
                      colors: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.emailAddress,
                      controller: usernameController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'enter your username';
                        }
                      },
                      isPassword: false,
                      icons: Icons.person,
                      hintText: 'Username',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.emailAddress,
                      controller: emialController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'emial is requred';
                        }
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(data) !=
                            true) {
                          return 'invalid emial structues';
                        }
                      },
                      isPassword: false,
                      icons: Icons.email,
                      hintText: 'E-Mail',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      hintText: 'Phone Number',
                      icons: Icons.numbers,
                      isPassword: false,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(data)) {
                          return 'Please enter valid mobile number';
                        }
                        if (data.length < 11) {
                          return 'phone number contain 11 numbers';
                        }
                      },
                      controller: phoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.text,
                      controller: passwordController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'password is requred';
                        }
                        if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])')
                                .hasMatch(data) !=
                            true) {
                          return 'invalid password strucure';
                        }
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
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormFied(
                      textInputType: TextInputType.text,
                      controller: conifrmPasswordController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'confirm password is requred';
                        }
                        if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])')
                                .hasMatch(data) !=
                            true) {
                          return 'invalid password strucure';
                        } else if (data != passwordController.text.trim()) {
                          return 'confirmed password not match passwod';
                        }
                      },
                      isPassword: confirmisCheckedPassword,
                      suffixIconOnPress: () {
                        setState(() {
                          confirmisCheckedPassword = !confirmisCheckedPassword;
                        });
                      },
                      suffixIcon: confirmisCheckedPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      icons: Icons.lock,
                      hintText: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomButtom(
                      colors: Color(0xFFc5c5c5),
                      heigh: 45.0,
                      text: 'SIGN UP',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final UserCredential credential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: emialController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            await pushUserDataToFirebaseFirestore(firestore);
                            CustomErrorMessage(
                                context, 'account created successfully');
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (err) {
                            if (err.code == 'weak-password') {
                              CustomErrorMessage(context,
                                  'The password provided is too weak.');
                            } else if (err.code == 'email-already-in-use') {
                              CustomErrorMessage(
                                context,
                                'The account already exists for that email.',
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          } catch (err) {
                            CustomErrorMessage(
                              context,
                              'there was an error.',
                            );
                          }
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFc5c5c5),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 19.0,
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

  Future<void> pushUserDataToFirebaseFirestore(
      CollectionReference<Object?> firestore) async {
    await firestore
        .add({
          'username': usernameController.text.trim(),
          'emial': emialController.text.trim(),
          'phone number': phoneNumber.text.trim(),
          'password': passwordController.text.trim(),
          'confirmed password': conifrmPasswordController.text.trim(),
        })
        .then(
          (value) => print("User Added"),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }
}
