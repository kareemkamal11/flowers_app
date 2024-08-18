import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

import 'add_cart_widget.dart';

class ItemSellingWidget extends StatelessWidget {
  const ItemSellingWidget({
    super.key,
    required this.favoriteClick,
    required this.isFavorite,
    required this.title,
    required this.flavor,
    required this.price,
  });

  final Function() favoriteClick;


  final bool isFavorite;

  final String title;
  final String flavor;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 200,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFF7CCC6)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.55, 0.45],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x7FFF7474),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsUtil.donuts,
                    width: 117,
                    height: 78,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  title,
                  style: AppStyles.robotoStyle.copyWith(
                    color: AppStyles.mainColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'flavor : $flavor',
                  style: AppStyles.futuraStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  '$price ${AppText.currency}',
                  style: AppStyles.robotoStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 7,
            right: 9,
            child: InkWell(
              onTap: favoriteClick,
              splashColor: Colors.transparent,
              child: Container(
                width: 35,
                height: 35,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                ),
              ),
            ),
          ),
          const AddCartWidget()
        ],
      ),
    );
  }
}
