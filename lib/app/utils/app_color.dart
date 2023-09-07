import 'package:flutter/material.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primarySoft],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static Color primary = Color(0xffF7EBE1);
  static Color primarySoft = Color(0xFF184AA6);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xff132137);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);
  static Color iya = Color.fromARGB(255, 77, 168, 107);
  static Color tidak = Color.fromARGB(255, 173, 47, 47);
  
}
