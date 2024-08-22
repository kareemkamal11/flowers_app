import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view_models/product_details_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/buy_product_widgets.dart';
import '../../utils/products_conter_widget.dart';
import 'product_info_details_widget.dart';

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
          const ProductInfoDetailsWidget(),
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
          BuyProductWidgets(
            onPressed: (){
              context.push(AppNavigator.cartScreen());
            },
            totalProducts: productsCubit.products,
            totalPrice: productsCubit.products,
            titleButton: AppText.addtoCart,
           )
        ],
      ),
    );
  }
}
