import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

import '../utils/custom_appbar_widget.dart';
import 'widgets/best_selling_list.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarWidget(
              title: AppText.bestSelling,
            ),
          ),
          BestSellingList(),
        ],
      )),
    );
  }
}
