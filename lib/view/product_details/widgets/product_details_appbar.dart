import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_appbar_widget.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar(
    this.screenHeight, {
    super.key,
    required this.image,
  });

  final double screenHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight / 3,
      color: AppStyles.secondaryColor,
      child: Stack(
        children: [
          CustomAppBarWidget(
            title: ' ',
            customBackButton: () {
              Navigator.of(context).pop();
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              image,
              width: 150,
              height: 230,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
