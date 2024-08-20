import 'package:flowers/core/app_route.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/buy_product_widgets.dart';
import 'package:flowers/view/utils/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/item_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppBarWidget(
                    title: AppText.cart,
                  ),
                ),
                SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: ItmeCart(),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: BuyProductWidgets(
                onPressed: () {
                  GoRouter.of(context).push(AppRoute.confirmOrder);
                },
                totalProducts: 0,
                totalPrice: 0,
                titleButton: AppText.confirm,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
