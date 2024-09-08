import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/category_details_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_search_widget.dart';
import '../../utils/custom_appbar_widget.dart';
import 'category_item_details.dart';

class CategoryListBody extends StatefulWidget {
  const CategoryListBody({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ItemModel> items;

  @override
  State<CategoryListBody> createState() => _CategoryListBodyState();
}

class _CategoryListBodyState extends State<CategoryListBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(update);
  }

  void update() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchController.removeListener(update);
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBarWidget(
                title: widget.title,
                customWidget: AppSearchWidget(
                  searchController: searchController,
                  onSaved: (value) {},
                  onSearchTapped: () {},
                  suffinxIcon: const SizedBox(),
                  hintText: AppText.hintSearchCategory(widget.title),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return CategoryItemDetails(
              title: widget.items[index].name,
              image: widget.items[index].image,
              description: widget.items[index].description,
              price: widget.items[index].price,
              flavor: widget.items[index].flavor,
            );
          },
        ),
      ],
    );
  }
}
