import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class ShowProductsConter extends StatelessWidget {
  const ShowProductsConter({
    super.key,
    required this.totalProducts,
    required this.totalPrice,
  });

  final int totalProducts;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppStyles.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: .50,
            color: AppStyles.mainColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Selected Items ($totalProducts)',
            style: AppStyles.robotoStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Total: $totalPrice ${AppText.currency}',
            style: AppStyles.robotoStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
