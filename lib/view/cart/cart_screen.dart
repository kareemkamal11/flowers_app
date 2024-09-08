import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/buy_product_widgets.dart';
import 'package:flowers/view/utils/custom_appbar_widget.dart';
import 'package:flowers/view_models/cart_cubit/cart_cubit.dart';
import 'package:flowers/view_models/cart_cubit/cart_state.dart';
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
    return SafeArea(child: BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CartCubit>(context);
        final cartEmpty = cubit.cItemsCartData.isEmpty;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomAppBarWidget(
                      title: AppText.cart,
                      customIcon: cartEmpty ? Icons.arrow_back_ios : Icons.add,
                      customBackButton: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  cartEmpty
                      ? const SliverToBoxAdapter(child: CartIsEmpty())
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: cubit.cItemsCartData.length,
                            (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: ItmeCart(
                                  title: cubit.cItemsCartData[index].title,
                                  description:
                                      cubit.cItemsCartData[index].description,
                                  price: cubit.cItemsCartData[index].price,
                                  totalPrice:
                                      cubit.cItemsCartData[index].totalPrice,
                                  image: cubit.cItemsCartData[index].image,
                                  flavor: cubit.cItemsCartData[index].flavor, 
                                  totalProducts:
                                      cubit.cItemsCartData[index].totalProducts,
                                  icrement: () => cubit.icrement(index),
                                  decrement: () => cubit.decrement(index),
                                  removeItem: () => cubit.removeItem(index),
                                ),
                              );
                            },
                          ),
                        ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 7,
                left: 20,
                right: 20,
                child: cartEmpty
                    ? const SizedBox()
                    : BuyProductWidgets(
                        onPressed: () async {
                          Navigator.of(context)
                              .push(AppNavigator.checkoutScreen());
                          await Future.delayed(const Duration(seconds: 1),
                              () => cubit.checkout());
                        },
                        totalProducts: cubit.totalItems,
                        totalPrice: cubit.totalPrice,
                        titleButton: AppText.confirm,
                      ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    ));
  }
}
