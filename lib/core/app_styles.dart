import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static Color mainColor = const Color(0xFF3A312F);
  static Color secondaryColor = const Color(0xFFF7CCC6);
  static Color boxColor = const Color(0x3FF7CCC6);
  static Color seeallColor = const Color(0xFFD1A39C);
  static Color hintColor = const Color(0xA53C312F);
  static Color pinkColor = const Color(0xFFFF7474);
  static Color cardColor = const Color(0xFFFDF0EE);

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

  static TextStyle allertaStencil = GoogleFonts.allertaStencil(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static ShapeDecoration boxDecoration = ShapeDecoration(
    gradient: LinearGradient(
      end: const Alignment(1.00, 0.03),
      begin: const Alignment(-1, -0.03),
      colors: [
        AppStyles.cardColor.withOpacity(0.8),
        AppStyles.cardColor.withOpacity(0.1)
      ],
    ),
    shape: RoundedRectangleBorder(
      side:  BorderSide(width: 1, color: AppStyles.secondaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
