import 'package:flowers/core/app_route.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 35,
            ),
          ),
          Image.asset(
            AssetsUtil.logoImage,
            width: 90,
            height: 75,
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoute.cart);
              },
              icon: const Icon(
                // shopping cart icon
                Icons.shopping_cart_outlined,
                size: 35,
              )),
        ],
      ),
    );
  }
}
