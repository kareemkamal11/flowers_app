import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/buy_product_widgets.dart';
import 'package:flowers/view/utils/custom_appbar_widget.dart';
import 'package:flowers/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/cart_empty.dart';
import 'widgets/item_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CustomAppBarWidget(
                  title: AppText.cart,
                  customIcon: Icons.add,
                  customBackButton: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              cubit.cItemsCartData.isEmpty
                  ? const CartIsEmpty()
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: cubit.cItemsCartData.length,
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: ItmeCart(
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
          Positioned(
            bottom: 7,
            left: 20,
            right: 20,
            child: BuyProductWidgets(
              onPressed: () {
                Navigator.of(context).push(AppNavigator.checkoutScreen());
              },
              totalProducts: cubit.totalItems,
              totalPrice: cubit.totalPrice,
              titleButton: AppText.confirm,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
