import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({
    super.key,
    required this.onTap, required this.hintText,
  });

  final Function() onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: onTap,
          child: Container(
              width: 45,
              height: 50,
              decoration: ShapeDecoration(
                color: AppStyles.secondaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: const Icon(Icons.search)),
        ),
      ],
    );
  }
}
