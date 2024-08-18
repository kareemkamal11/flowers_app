import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view_models/product_details/counter_cubit.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_button_widget.dart';
import '../../utils/products_conter_widget.dart';
import '../../utils/show_products_conter_widget.dart';

class ProductDetailsBuyWidget extends StatelessWidget {
  const ProductDetailsBuyWidget({
    super.key,
    required this.screenHeight,
    required this.productsCubit,
  });

  final double screenHeight;
  final CounterCubit productsCubit;

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
          Container(
            height: 2,
            color: AppStyles.secondaryColor,
          ),
          const SizedBox(height: 40),
          ProductsConter(
            products: productsCubit.products,
            addProduct: productsCubit.addProduct,
            removeProduct: productsCubit.removeProduct,
          ),
          const SizedBox(height: 80),
          ShowProductsConter(
            totalProducts: productsCubit.products,
            totalPrice: productsCubit.products,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            title: AppText.addtoCart,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
