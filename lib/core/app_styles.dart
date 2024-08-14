import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static Color mainColor = const Color(0xFF3A312F);
  static Color secondaryColor = const Color(0xFFF7CCC6);
  static Color boxColor = const Color(0x3FF7CCC6);
  static Color seeallColor = const Color(0xFFD1A39C);
  

  static TextStyle robotoStyle = GoogleFonts.roboto(
    color: mainColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle robotoStyleWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );


  static TextStyle pangolinStyle = GoogleFonts.pangolin(
    color: mainColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle futuraStyle = const TextStyle(
    color: Color(0xFF949494),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
