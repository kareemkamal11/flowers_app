import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              Image.asset(AssetsUtil.logoImage, width: 80, height: 43),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    // shopping cart icon
                    Icons.shopping_cart,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
