import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/custom_appbar_widget.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/item_selling_widget.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: CustomAppBarWidget(title: AppText.favorite)),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<HomeScreenCubit>(context);
              return SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: cubit.cListFavourite.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ItemSellingWidget(
                      favoriteClick: () {
                        cubit.updateFavourite(index);
                      },
                      title: cubit.cListFavourite[index].name,
                      image: cubit.cListFavourite[index].image,
                      price: cubit.cListFavourite[index].price,
                      flavor: cubit.cListFavourite[index].flavor,
                      isFavorite: cubit.cListFavourite[index].isFavourite,
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
