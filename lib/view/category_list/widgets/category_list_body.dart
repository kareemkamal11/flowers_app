import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_search_widget.dart';
import '../../utils/custom_appbar_widget.dart';
import 'category_item_details.dart';

class CategoryListBody extends StatelessWidget {
  const CategoryListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBarWidget(
                title: 'Milk Shake',
                customWidget: AppSearchWidget(
                  onTap: () {},
                  hintText: AppText.searchCategory('Milk Shake'),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CategoryItemDetails(
              title: 'Oreo Milkshake',
              description:
                  'There are many variations of passages of Lorem Ipsum',
              price: '45.',
            );
          },
        ),
      ],
    );
  }
}
