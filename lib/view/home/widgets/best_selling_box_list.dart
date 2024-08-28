import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/seeall_widget.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/item_selling_widget.dart';

class BestSellingBoxList extends StatelessWidget {
  const BestSellingBoxList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeScreenCubit>(context);
        return Column(
          children: [
            Row(
              children: [
                Text(
                  AppText.bestSelling,
                  style: AppStyles.robotoStyle,
                ),
                const Spacer(),
                SeeallWidget(
                  onTap: () {
                    Navigator.of(context).push(AppNavigator.bestSelling());
                  },
                )
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 220,
              padding: const EdgeInsets.only(bottom: 15),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemSellingWidget(
                    favoriteClick: () {
                      cubit.updateFavourite(index);
                    },
                    title: cubit.cListBestSelling[index].name,
                    image: cubit.cListBestSelling[index].image,
                    price: cubit.cListBestSelling[index].price,
                    flavor: cubit.cListBestSelling[index].flavor,
                    isFavorite: cubit.cListBestSelling[index].isFavourite,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
