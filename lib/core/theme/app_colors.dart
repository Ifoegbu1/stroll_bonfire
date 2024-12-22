import 'package:flutter/material.dart';

class AppColors {
  static  Color primaryClr = fromHex('#8B88EF');
  static const Color white = Colors.white;
  static const Color darkBlue = Color.fromRGBO(36, 59, 77, 1.0);
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
