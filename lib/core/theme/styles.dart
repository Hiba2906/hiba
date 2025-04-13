import 'package:flutter/material.dart';

class AppStyles {
  // ستايل زر تسجيل الدخول
  //static final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
  static ButtonStyle buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      minimumSize: const Size(299, 78),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
