import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/core/navigation_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/custom_button_widget.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
        left: 25,
        right: 25,
      ),
      child: Column(
        children: [
          Lottie.asset(
            AssetsUtil.cartEmpty,
            width: 230,
            height: 230,
          ),
          const Text(
            AppText.emptyCart,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 120),
          CustomButtonWidget(
              title: AppText.goShoppingNow,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(AppNavigator.homeScreen());
              })
        ],
      ),
    );
  }
}
