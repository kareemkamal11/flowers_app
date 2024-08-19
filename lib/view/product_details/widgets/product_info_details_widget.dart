import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class ProductInfoDetailsWidget extends StatelessWidget {
  const ProductInfoDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Oreo Milkshake',
              style: AppStyles.pangolinStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '45. ${AppText.currency}',
              style: AppStyles.robotoStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Text(
          'There are many variations of passages of Lorem Ipsum available, he majority have There are many  variations of passages of Lorem Ipsum available,  he majority have',
          style: AppStyles.robotoStyle.copyWith(
            fontSize: 18,
            color: AppStyles.hintColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
