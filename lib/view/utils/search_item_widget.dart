import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/add_cart_widget.dart';
import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    this.flavor,
    required this.price,
  });

  final String image;
  final String name;
  final String description;
  final String? flavor;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: AppStyles.boxDecoration,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.pangolinStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: AppStyles.futuraStyle,
                        maxLines: flavor == null ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      flavor == null
                          ? const SizedBox()
                          : Column(
                              children: [
                                const SizedBox(height: 5),
                                RichText(
                                    text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${AppText.flavor} : ',
                                      style: AppStyles.robotoStyle.copyWith(
                                        color: AppStyles.pinkColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: flavor,
                                      style: AppStyles.robotoStyle,
                                    )
                                  ],
                                ))
                              ],
                            ),
                      const SizedBox(height: 10),
                      Text(
                        '${AppText.price} : $price ${AppText.currency}',
                        style: AppStyles.robotoStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(image),
                )
              ],
            ),
          ),
          AddCartWidget(
            image: image,
            productName: name,
            productPrice: price,
          ),
        ],
      ),
    );
  }
}
