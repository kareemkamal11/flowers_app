import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class AppWidget {
  static Widget seeall = Row(
    children: [
      Text(
        'See All',
        style: AppStyles.robotoStyle
            .copyWith(color: AppStyles.secondaryColor, fontSize: 15),
      ),
      Image.asset(AssetsUtil.arrow),
    ],
  );
}
