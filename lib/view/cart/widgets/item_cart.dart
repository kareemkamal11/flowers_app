import 'package:flowers/core/app_styles.dart';
import 'package:flowers/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/products_conter_widget.dart';
import 'cancel_product_widget.dart';
import 'cart_details_widget.dart';

class ItmeCart extends StatelessWidget {
  const ItmeCart({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);
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
                const Expanded(
                  flex: 2,
                  child: CartDetailsWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        cubit.cItemsCartData[index].image,
                        width: 100,
                        height: 120,
                      ),
                      const SizedBox(height: 15),
                      ProductsConter(
                        products: cubit.cItemsCartData[index].totalProducts,
                        addProduct: () => cubit.icrement(index),
                        removeProduct: () => cubit.decrement(index),
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
