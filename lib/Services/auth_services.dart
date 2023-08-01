// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously, unused_local_variable, avoid_print, unused_catch_clause, non_constant_identifier_names

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/user_country_selection.dart';
import 'package:news_app/Widgets/custom_error_message.dart';

class Authintications {
  // signout of the acount.
  static Future<User?> signout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => log('signout'))
        .onError(
          (error, stackTrace) => print(
            'err',
          ),
        );
  }

  // create user account with emial and password
  static Future<User?> signUp({
    required String userEmail,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);
      CustomErrorMessage(context, 'account created successfully');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomErrorMessage(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomErrorMessage(
            context, 'The account already exists for that email.');
      }
    } catch (e) {
      CustomErrorMessage(
        context,
        'there was an error.',
      );
    }
  }

  // login to user account.
  static Future<User?> login({
    required emial,
    required password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emial,
        password: password,
      );
      CustomErrorMessage(context, 'Login...');
      Navigator.pushReplacementNamed(context, CountrySelectionScreen.id);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        CustomErrorMessage(context, 'No user found for that email.');
      } else if (err.code == 'wrong-password') {
        CustomErrorMessage(context, 'Wrong password provided for that user.');
      }
    } catch (err) {
      CustomErrorMessage(context, 'somethin went wrong.');
    }
  }

  // reset user password.
  static Future<User?> resetPassword({
    required String emial,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emial);
    } catch (err) {
      CustomErrorMessage(context, 'something went wront');
    }
  }

  // create an account with google acount.
  void createAccountWithGoogle({required BuildContext context}) {}

  // create account with facebook
  void CreateAccountWithFacebook({required BuildContext context}) {}

  // create account with apple
  void CreateAccountWithApple({required BuildContext context}) {}
}
