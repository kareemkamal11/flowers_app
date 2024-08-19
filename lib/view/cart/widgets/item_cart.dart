import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

import '../../utils/products_conter_widget.dart';
import 'cancel_product_widget.dart';
import 'cart_details_widget.dart';

class ItmeCart extends StatelessWidget {
  const ItmeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: 350,
      height: 200,
      decoration: AppStyles.boxDecoration,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 10,
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: CartDetailsWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsUtil.productDetails,
                        width: 100,
                        height: 120,
                      ),
                      const SizedBox(height: 15),
                      ProductsConter(
                        products: 1,
                        addProduct: () {},
                        removeProduct: () {},
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
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

