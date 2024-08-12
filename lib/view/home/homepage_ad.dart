
import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class HomePageAd extends StatelessWidget {
  const HomePageAd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Choose What Suits \n Your Test',
            style: AppStyles.pangolinStyle,
          ),
        ),
        const SizedBox(height: 5),
        Image.asset(
          AssetsUtil.ad,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
