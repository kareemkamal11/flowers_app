import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class SeeallWidget extends StatelessWidget {
  const SeeallWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
      children: [
        Text(
          AppText.seeAll,
          style: AppStyles.robotoStyle
              .copyWith(
                // set border color to black
                color: AppStyles.seeallColor,
                fontSize: 16,
                fontWeight: FontWeight.w500
                ),
        ),
        Image.asset(AssetsUtil.arrow),
      ],
        ),
    );
  }
}