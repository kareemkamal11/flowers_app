import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/item_selling_widget.dart';

class BestSellingList extends StatelessWidget {
  const BestSellingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeScreenCubit>(context);
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: cubit.cListBestSelling.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ItemSellingWidget(
                favoriteClick: () {
                  cubit.updateFavourite(index);
                },
                title: cubit.cListBestSelling[index].name,
                image: cubit.cListBestSelling[index].image,
                price: cubit.cListBestSelling[index].price,
                flavor: cubit.cListBestSelling[index].flavor,
                isFavorite: cubit.cListBestSelling[index].isFavourite,
              ),
            );
          },
        );
      },
    );
  }
}
