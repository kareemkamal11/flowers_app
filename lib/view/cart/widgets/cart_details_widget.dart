import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class CartDetailsWidget extends StatelessWidget {
  const CartDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Oreo Milkshake',
          style: AppStyles.pangolinStyle.copyWith(fontSize: 22),
        ),
        Text(
          'There are many variations of passages of Lorem Ipsum',
          style: AppStyles.robotoStyle
              .copyWith(fontSize: 18, color: AppStyles.hintColor),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),
        Text(
          '${AppText.price} : 45. ${AppText.currency}',
          style: AppStyles.robotoStyle.copyWith(
              color: AppStyles.pinkColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: AppStyles.robotoStyle.copyWith(
                color: AppStyles.hintColor, fontSize: 16),
            children: [
              TextSpan(
                text: 'Total : ',
                style: AppStyles.robotoStyle.copyWith(
                  color: AppStyles.pinkColor,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: '90. ${AppText.currency}',
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

