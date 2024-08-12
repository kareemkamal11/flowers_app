import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
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
              onPressed: () {},
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
