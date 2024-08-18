import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

import '../static/custom_appbar_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppStyles.secondaryColor,
              child: Stack(
                children: [
                  const CustomAppBarWidget(
                    title: ' ',
                  ),
                  Image.asset(
                    AssetsUtil.milkshake,
                    width: 109,
                    height: 221,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              // add child and add Column to content Row and insid this Row add two text widget
              // and in the column add text widget for subtitle and Divider and counter to add or remove values number
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Milkshake',
                          style: AppStyles.pangolinStyle,
                        ),
                        Text(
                          'Strawberry',
                          style: AppStyles.robotoStyle,
                        ),
                      ]),
                  Column(
                    children: [
                      Text(
                        '\$ 5.00',
                        style: AppStyles.robotoStyle,
                      ),
                      Divider(
                        color: AppStyles.mainColor,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppStyles.secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: AppStyles.mainColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1',
                            style: AppStyles.robotoStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppStyles.secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppStyles.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
