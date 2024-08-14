import 'package:flutter/material.dart';

import 'widgets/best_selling_widget.dart';
import 'widgets/home_appbar_widget.dart';
import 'widgets/home_search_widget.dart';
import 'widgets/homepage_ad_widget.dart';
import 'widgets/discover_category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                const HomeAppBarWidget(),
                const HomePageAdWidget(),
                HomeSearchWidget(onTap: () {}),
                const SizedBox(height: 25),
                const DiscoverCategoriesWidget(),
                const SizedBox(height: 25),
                const BestSellingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

