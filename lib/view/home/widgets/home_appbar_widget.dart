import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

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
                Navigator.of(context).push(AppNavigator.cartScreen());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 35,
              )),
        ],
      ),
    );
  }
}
