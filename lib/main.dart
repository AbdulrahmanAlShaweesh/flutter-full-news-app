// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:news_app/Providers/news_provider.dart';
import 'package:news_app/Screens/account_Ready_to_use_screen.dart';
import 'package:news_app/Screens/get_started_screen.dart';
import 'package:news_app/Screens/otp_reset_password_screen.dart';
import 'package:news_app/Screens/reset_password_screen.dart';
import 'package:news_app/Screens/reset_password_method.dart';
import 'package:news_app/Screens/login_screen.dart';
import 'package:news_app/Screens/main_screen.dart';
import 'package:news_app/Screens/register_Screen.dart';
import 'package:news_app/Screens/user_country_selection.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        // theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ResetPaasordMethod.id: (context) => ResetPaasordMethod(),
          ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
          CountrySelectionScreen.id: (context) => CountrySelectionScreen(),
          GetStartedScreen.id: (context) => GetStartedScreen(),
          OTPScreen.id: (context) => OTPScreen(),
          StareUsingApp.id: (context) => StareUsingApp(),
        },
        home: MainScreen(),
      ),
    );
  }
}
