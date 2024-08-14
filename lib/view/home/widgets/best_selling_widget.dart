import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/widgets/seeall_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/item_selling_widget.dart';

class BestSellingWidget extends StatefulWidget {
  const BestSellingWidget({super.key});

  @override
  State<BestSellingWidget> createState() => _BestSellingWidgetState();
}

class _BestSellingWidgetState extends State<BestSellingWidget> {

 bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppText.bestSelling,
              style: AppStyles.robotoStyle,
            ),
            const Spacer(),
            SeeallWidget(onTap: () {
              print('See all');
            })
          ],
        ),
        const SizedBox(height: 15),
        Container(
          height: 220,
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return  ItemSellingWidget(
                favoriteClick: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                addCartClick: () {
                  print('Add to cart');
                },
                isFavorite: isFavorite,
              );
            },
          ),
        ),
      ],
    );
  }
}

