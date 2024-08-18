import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

import '../static/custom_appbar_widget.dart';
import 'widgets/best_selling_list.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    favoriteClick() {
      print('Favorite Clicked');
    }

    addCartClick() {
      print('Add Cart Clicked');
    }

    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CustomAppBarWidget(
              title: AppText.bestSelling,
            ),
          ),
          BestSellingList(
            isFavorite: isFavorite,
            favoriteClick: favoriteClick,
            addCartClick: addCartClick,
          ),
        ],
      )),
    );
  }
}
