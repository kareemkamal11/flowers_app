import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/view/utils/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AssetsUtil.cartEmpty),
          const Text(
            AppText.emptyCart,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
