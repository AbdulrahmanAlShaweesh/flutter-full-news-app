// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatelessWidget {
  CountrySelectionScreen({super.key});

  static String id = 'country selection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Text('Select Your Country'),
    );
  }
}
