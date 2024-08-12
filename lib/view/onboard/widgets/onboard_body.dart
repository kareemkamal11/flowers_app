import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.bodyImage,
    required this.titleText,
  });

  final String bodyImage;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(
              bodyImage,
              width: 320,
              height: 195,
              fit: BoxFit.contain,
            ),
            Text(
              titleText,
              style: GoogleFonts.rockSalt(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Made by hand, from scratch \n with love',
              style: GoogleFonts.amiri(
                color: const Color(0xA53C312F),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}
