import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/products_conter_widget.dart';
import 'cancel_product_widget.dart';
import 'cart_details_widget.dart';

class ItmeCart extends StatelessWidget {
  ItmeCart({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.totalPrice,
    required this.image,
    required this.totalProducts,
    required this.icrement,
    required this.decrement,
    required this.removeItem,
    this.flavor, // هذا الباراميتر اختياري واذا لم يتم ارسال قيمة له سيكون قيمته null
  });

  String? flavor;
  final String title;
  final String description;
  final double price;
  final double totalPrice;
  final String image;
  final int totalProducts;
  final Function() icrement;
  final Function() decrement;
  final Function() removeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 210,
      decoration: AppStyles.boxDecoration,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 10,
              bottom: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CartDetailsWidget(
                    title: title,
                    description: description,
                    priceProduct: price,
                    totalPrice: totalPrice,
                    flavor: flavor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        image,
                        width: 100,
                        height: 120,
                      ),
                      const SizedBox(height: 15),
                      ProductsConter(
                        products: totalProducts,
                        addProduct: icrement,
                        removeProduct: decrement,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CancelProductWidget(
              onTap: removeItem,
            ),
          )
        ],
      ),
    );
  }
}
