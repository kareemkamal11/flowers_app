import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_appbar_widget.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight / 3,
      color: AppStyles.secondaryColor,
      child: Stack(
        children: [
          const CustomAppBarWidget(
            title: ' ',
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetsUtil.productDetails,
              width: 115,
              height: 230,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
