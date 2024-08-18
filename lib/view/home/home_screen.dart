import 'package:flowers/core/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/best_selling_box_list.dart';
import 'widgets/home_appbar_widget.dart';
import '../utils/app_search_widget.dart';
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
                AppSearchWidget(
                  onTap: () {},
                  hintText: 'search here  ..',
                ),
                const SizedBox(height: 25),
                DiscoverCategoriesWidget(
                  onTap: () {
                    GoRouter.of(context).push(AppRoute.categorylist);
                  },
                ),
                const SizedBox(height: 25),
                const BestSellingBoxList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
