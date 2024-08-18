import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: const Size(400, 70),
      ),
      child: Text(
        title,
        style: AppStyles.robotoStyleWhite.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
