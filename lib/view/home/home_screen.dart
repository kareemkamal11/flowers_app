// ignore: unused_import
import 'dart:developer';

import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';
import 'package:flowers/view/utils/app_search_widget.dart';
import 'package:flowers/view/utils/search_item_widget.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/best_selling_box_list.dart';
import 'widgets/home_appbar_widget.dart';
import 'widgets/homepage_ad_widget.dart';
import 'widgets/discover_category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
        var cubit = BlocProvider.of<HomeScreenCubit>(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  const HomeAppBarWidget(),
                  const HomePageAdWidget(),
                  AppSearchWidget(
                    searchController: cubit.searchController,
                    onSaved: (value) => cubit.onSaved(value),
                    onSearchTapped: () {
                      cubit.searchAction();
                      log("Search word: ${cubit.searchWord}");

                      if (cubit.searchWord.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              AppText.searchEmpty,
                              style: AppStyles.robotoStyleWhite,
                            ),
                          ),
                        );
                      }
                      if (cubit.searchWord.isNotEmpty &&
                          cubit.resultSearchList.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: AppText.noResults(cubit.searchWord),
                          ),
                        );
                      }
                    },
                    suffinxIcon: cubit.searchWord.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              cubit.removeWord();
                            },
                            icon: const Icon(Icons.clear,
                                color: Colors.red, size: 20),
                          )
                        : const SizedBox(),
                    hintText: AppText.hintSearch,
                  ),
                  const SizedBox(height: 10),
                  if (cubit.searchWord.isNotEmpty &&
                      cubit.resultSearchList.isNotEmpty)
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 50),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.resultSearchList.length,
                      itemBuilder: (context, index) {
                        return SearchItemWidget(
                          image: cubit.resultSearchList[index].image,
                          name: cubit.resultSearchList[index].name,
                          description: AppText.describtionText,
                          flavor: cubit.resultSearchList[index].flavor,
                          price: cubit.resultSearchList[index].price,
                        );
                      },
                    )
                  else
                    BottomHomeWidget(
                      list: cubit.cListDiscoveryCategory,
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class BottomHomeWidget extends StatelessWidget {
  const BottomHomeWidget({
    super.key,
    required this.list,
  });

  final List<DiscoveryCategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DiscoverCategoriesWidget(
          listDiscoveryCategory: list,
        ),
        const SizedBox(height: 25),
        const BestSellingBoxList(),
      ],
    );
  }
}




