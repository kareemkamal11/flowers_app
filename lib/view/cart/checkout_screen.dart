import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/view/utils/custom_button_widget.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsUtil.confirmBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsUtil.orderConfirm,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 15),
                Text(AppText.confirmOrder,
                    style: AppStyles.robotoStyle
                        .copyWith(fontSize: 23, fontWeight: FontWeight.w200)),
                const SizedBox(height: 120),
                CustomButtonWidget(
                  title: AppText.backHome,
                  onPressed: () => Navigator.of(context)
                      .pushReplacement(AppNavigator.homeScreen()),
                )
              ],
            )),
      ),
    );
  }
}
