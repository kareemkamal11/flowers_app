import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/view/utils/custom_appbar_widget.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../utils/item_selling_widget.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: CustomAppBarWidget(title: AppText.favorite)),
                BlocBuilder<HomeScreenCubit, HomeScreenState>(
                  builder: (context, state) {
                    var cubit = BlocProvider.of<HomeScreenCubit>(context);
                    return cubit.cListFavourite.isEmpty
                        ? const FavoriteEmptyWidget()
                        : SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: cubit.cListFavourite.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: ItemSellingWidget(
                                  favoriteClick: () {
                                    cubit.removeFavourite(index);
                                  },
                                  title: cubit.cListFavourite[index].name,
                                  image: cubit.cListFavourite[index].image,
                                  price: cubit.cListFavourite[index].price,
                                  flavor: cubit.cListFavourite[index].flavor,
                                  isFavorite:
                                      cubit.cListFavourite[index].isFavourite,
                                ),
                              );
                            },
                          );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class FavoriteEmptyWidget extends StatelessWidget {
  const FavoriteEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(AssetsUtil.searchEmpty,
                width: 350, height: 350),
            const SizedBox(height: 25),
            Text(
              AppText.emptyFavorite,
              style: AppStyles.pangolinStyle.copyWith(
                color: AppStyles.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
