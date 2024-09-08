import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class ProductInfoDetailsWidget extends StatelessWidget {
  ProductInfoDetailsWidget({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.description,
    this.flavor,
  });

  final String productName;
  final double productPrice;
  final String description;
  String? flavor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: AppStyles.pangolinStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            flavor == null
                ? const SizedBox()
                : Text(
                    flavor!,
                    style: AppStyles.robotoStyle,
                  ),
            Text(
              '$productPrice ${AppText.currency}',
              style: AppStyles.robotoStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Text(
          description,
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
