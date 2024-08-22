import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/category_details_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_search_widget.dart';
import '../../utils/custom_appbar_widget.dart';
import 'category_item_details.dart';

class CategoryListBody extends StatelessWidget {
  const CategoryListBody({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    String title = 'Category List';
    List<ItemModel> listItems = [];
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
          itemCount: 10,
          itemBuilder: (context, index) {
            return CategoryItemDetails(
              title: listItems[index].name,
              image: listItems[index].image,
              description: listItems[index].description,
              price: listItems[index].price,
            );
          },
        ),
      ],
    );
  }
}
