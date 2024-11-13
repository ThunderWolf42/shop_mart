import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle( // Added 'const' keyword
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        fontFamily: 'Poppins');
  }
}
