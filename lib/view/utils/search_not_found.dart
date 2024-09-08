import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    super.key,
    required this.searchWord,
  });

  final String searchWord;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(AssetsUtil.searchEmpty, width: 300, height: 300),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: AppText.notFoundSearch,
            style: AppStyles.pangolinStyle,
            children: [
              TextSpan(
                text: searchWord,
                style: AppStyles.pangolinStyle.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
