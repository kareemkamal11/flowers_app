import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/add_cart_widget.dart';
import 'package:flutter/material.dart';

class CategoryItemDetails extends StatelessWidget {
  const CategoryItemDetails({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  final String title;
  final String description;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
      child: Container(
        width: 329,
        height: 120,
        decoration: AppStyles.boxDecoration,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: AppStyles.pangolinStyle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            description,
                            style: AppStyles.robotoStyle.copyWith(
                              color: const Color(0xA53C312F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '$price ${AppText.currency}',
                            style: AppStyles.robotoStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      image,
                    ),
                  )
                ],
              ),
            ),
            const AddCartWidget()
          ],
        ),
      ),
    );
  }
}
