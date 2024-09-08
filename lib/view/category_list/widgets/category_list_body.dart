import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/category_details_model.dart';
import 'package:flowers/view/utils/search_item_widget.dart';
import 'package:flowers/view/utils/search_not_found.dart';
import 'package:flowers/view_models/category_search/category_search_cubit.dart';
import 'package:flowers/view_models/category_search/category_search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<CategorySearchCubit, CategorySearchState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CategorySearchCubit>(context);
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBarWidget(
                    title: title,
                    customWidget: AppSearchWidget(
                      searchController: cubit.searchController,
                      onSaved: (value) => cubit.onSaved(value),
                      suffinxIcon: cubit.searchWord.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: cubit.removeWord,
                            )
                          : const SizedBox(),
                      onSearchTapped: () {
                        cubit.searchAction(items);
                        if (cubit.searchWord.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 500),
                              backgroundColor: Colors.red,
                              content: Text(
                                AppText.searchEmpty,
                                style: AppStyles.robotoStyleWhite
                              ),
                            ),
                          );
                        }
                      },
                      hintText: AppText.hintSearchCategory(title),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            (cubit.searchWord.isNotEmpty && cubit.actionSearch)
                ? (cubit.resultSearchList.isEmpty && cubit.actionSearch)
                    ? SliverToBoxAdapter(
                        child: SearchNotFound(searchWord: cubit.searchWord))
                    : SliverList.builder(
                        itemCount: cubit.resultSearchList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 30),
                            child: SearchItemWidget(
                              name: cubit.resultSearchList[index].name,
                              image: cubit.resultSearchList[index].image,
                              price: cubit.resultSearchList[index].price,
                              flavor: cubit.resultSearchList[index].flavor,
                              description: AppText.describtionText,
                            ),
                          );
                        },
                      )
                : SliverList.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CategoryItemDetails(
                        title: items[index].name,
                        image: items[index].image,
                        description: items[index].description,
                        price: items[index].price,
                        flavor: items[index].flavor,
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}
