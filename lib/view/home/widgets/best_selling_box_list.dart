import 'package:flowers/core/app_route.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/seeall_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/item_selling_widget.dart';

class BestSellingBoxList extends StatefulWidget {
  const BestSellingBoxList({super.key});

  @override
  State<BestSellingBoxList> createState() => _BestSellingBoxListState();
}

class _BestSellingBoxListState extends State<BestSellingBoxList> {
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
            SeeallWidget(
              onTap: () {
                GoRouter.of(context).push(AppRoute.bestSelling);
              },
            )
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
              return ItemSellingWidget(
                favoriteClick: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                isFavorite: isFavorite,
                title: AppText.donuts,
                flavor: 'Chocolate',
                price: '45.',
              );
            },
          ),
        ),
      ],
    );
  }
}
