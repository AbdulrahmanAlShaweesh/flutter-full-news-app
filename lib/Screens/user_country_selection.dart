// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Widgets/custom_text_field.dart';

class CountrySelectionScreen extends StatefulWidget {
  CountrySelectionScreen({super.key});

  static String id = 'country selection';

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Select Your Country',
          style: TextStyle(
            fontSize: 19.0,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.exit_to_app,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            CustomTextFormFied(
              suffixIcon: Icons.search,
              hintText: 'Search',
              isPassword: false,
              validator: (country) {},
              controller: controller,
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
