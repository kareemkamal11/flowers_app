import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/view/utils/add_cart_widget.dart';
import 'package:flutter/material.dart';

class CategoryItemDetails extends StatelessWidget {
  const CategoryItemDetails({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
      child: Container(
        width: 329,
        height: 120,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            end: const Alignment(1.00, 0.03),
            begin: const Alignment(-1, -0.03),
            colors: [
              AppStyles.secondaryColor.withOpacity(0.8),
              AppStyles.secondaryColor.withOpacity(0.3)
            ],
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.60, color: Color(0xFFF7CCC6)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
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
                      AssetsUtil.milkshake,
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
