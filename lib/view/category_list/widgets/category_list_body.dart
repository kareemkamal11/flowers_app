import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/category_details_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_search_widget.dart';
import '../../utils/custom_appbar_widget.dart';
import 'category_item_details.dart';

class CategoryListBody extends StatelessWidget {
  const CategoryListBody({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBarWidget(
                title: title,
                customWidget: AppSearchWidget(
                  onTap: () {},
                  hintText: AppText.hintSearchCategory(title),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CategoryItemDetails(
              title: items[index].name,
              image: items[index].image,
              description: items[index].description,
              price: items[index].price,
            );
          },
        ),
      ],
    );
  }
}
