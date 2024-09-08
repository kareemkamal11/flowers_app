import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class CartDetailsWidget extends StatelessWidget {
  CartDetailsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.priceProduct,
    required this.totalPrice,
    this.flavor
  });

  final String title;
  final String description;
  final double priceProduct;
  final double totalPrice;
  String? flavor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.pangolinStyle.copyWith(fontSize: 22),
        ),
        Text(
          description,
          style: AppStyles.robotoStyle
              .copyWith(fontSize: 18, color: AppStyles.hintColor),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),
        flavor == null
            ? const SizedBox()
            : Text(
                flavor!,
                style: AppStyles.robotoStyle,
              ),
        Text(
          '${AppText.price} $priceProduct ${AppText.currency}',
          style: AppStyles.robotoStyle.copyWith(
              color: AppStyles.pinkColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: AppStyles.robotoStyle
                .copyWith(color: AppStyles.hintColor, fontSize: 16),
            children: [
              TextSpan(
                text: '${AppText.total} : ',
                style: AppStyles.robotoStyle.copyWith(
                  color: AppStyles.pinkColor,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: '${totalPrice.toStringAsFixed(2)} ${AppText.currency}',
                style: AppStyles.robotoStyle.copyWith(
                  color: AppStyles.mainColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
