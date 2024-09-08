import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
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
    required this.image,
  });

  final Function() favoriteClick;

  final bool isFavorite;

  final String title;
  final String image;
  final String flavor;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 220,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, AppStyles.cardColor],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.55, 0.45],
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
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    width: 117,
                    height: 60,
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
          AddCartWidget(
              image: image,
              productName: title,
              productPrice: price,
              flavor: flavor,
              ),
        ],
      ),
    );
  }
}
