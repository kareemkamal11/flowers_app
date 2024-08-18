import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/item_selling_widget.dart';

class BestSellingList extends StatelessWidget {
  const BestSellingList(
      {super.key,
      required this.isFavorite,
      required this.favoriteClick,
      required this.addCartClick});

  final bool isFavorite;
  final Function() favoriteClick;
  final Function() addCartClick;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ItemSellingWidget(
            favoriteClick: favoriteClick,
            isFavorite: isFavorite,
            title: AppText.donuts,
            flavor: 'Chocolate',
            price: '45.',
          ),
        );
      },
    );
  }
}
