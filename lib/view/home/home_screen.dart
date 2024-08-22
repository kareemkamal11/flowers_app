import 'package:flowers/core/app_text.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/app_drawer_widget.dart';
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
                        onTap: () {},
                        hintText: AppText.hintSearch,
                      ),
                      const SizedBox(height: 25),
                      DiscoverCategoriesWidget(
                        listDiscoveryCategory: cubit.cListDiscoveryCategory, 
                      ),
                      const SizedBox(height: 25),
                      const BestSellingBoxList(),
                    ],
                  ),
                ),
              ),
              drawer: const AppDrawerWidget(),
            );  
          }
          
      ),
    );
  }
}
