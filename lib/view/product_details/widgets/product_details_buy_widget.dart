import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/buy_product_widgets.dart';
import '../../utils/products_conter_widget.dart';
import 'product_info_details_widget.dart';

class ProductDetailsBuyWidget extends StatelessWidget {
  ProductDetailsBuyWidget(
    this.screenHeight, {
    super.key,
    required this.productName,
    required this.productPrice,
    required this.description,
    required this.productsCounter,
    required this.totalPrice,
    required this.totalProducts,
    required this.addProduct,
    required this.removeProduct,
    required this.buyProduct,
    this.flavor,
  });

  final double screenHeight;

  String? flavor;

  final String productName;
  final double productPrice;
  final String description;

  final int productsCounter;
  final double totalPrice;
  final int totalProducts;
  final Function() addProduct;
  final Function() removeProduct;

  final Function() buyProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2 * screenHeight / 3,
      padding: const EdgeInsets.all(25),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
      ),
      child: Column(
        children: [
          ProductInfoDetailsWidget(
            productName: productName,
            productPrice: productPrice,
            description: description,
            flavor: flavor,
          ),
          Container(
            height: 2,
            color: AppStyles.secondaryColor,
          ),
          const SizedBox(height: 40),
          ProductsConter(
            products: productsCounter,
            addProduct: addProduct,
            removeProduct: removeProduct,
          ),
          const SizedBox(height: 80),
          BuyProductWidgets(
            onPressed: buyProduct,
            totalProducts: totalProducts,
            totalPrice: totalPrice,
            titleButton: AppText.addtoCart,
          )
        ],
      ),
    );
  }
}
