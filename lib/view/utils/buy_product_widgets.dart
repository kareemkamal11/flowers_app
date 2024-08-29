
import 'package:flutter/material.dart';

import 'custom_button_widget.dart';
import 'show_products_conter_widget.dart';

class BuyProductWidgets extends StatelessWidget {
  const BuyProductWidgets({
    super.key,
    required this.onPressed,
    required this.totalProducts,
    required this.totalPrice,
    required this.titleButton,
  });

  final Function() onPressed;
  final int totalProducts;
  final double totalPrice;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          ShowProductsConter(
            totalProducts: totalProducts,
            totalPrice: totalProducts,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            title: titleButton,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
