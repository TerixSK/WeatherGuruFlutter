import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WGWidget {
  static ButtonStyle elevatedButtonStyle() {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(WGColors.additionalColor),
    );
  }

  static TextStyle createWhiteTextStyle(double fontSize,
      {bool isBold = false, Color color = WGColors.mainColor}) {
    return GoogleFonts.mulish(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w300,
      fontSize: fontSize,
    );
  }
}

class WGColors {
  static Color additionalColor = Colors.blue;
  static Color backgroundColor = Colors.blueAccent[100] ?? Colors.black;
  static const Color listViewItemColor = Colors.white24;
  static const Color mainColor = Colors.white;
}
