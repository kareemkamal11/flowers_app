import 'package:flowers/view/best_selling/best_selling_screen.dart';
import 'package:flowers/view/cart/cart_screen.dart';
import 'package:flowers/view/cart/checkout_screen.dart';
import 'package:flowers/view/category_list/category_list_screen.dart';
import 'package:flowers/view/onboard/onboard_view.dart';
import 'package:flowers/view/product_details/product_details_screen.dart';
import 'package:flowers/view_models/cart_cubit/cart_cubit.dart';
import 'package:flowers/view_models/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/favorite_list_screen.dart';
import '../view/home/home_screen.dart';

class AppNavigator {
  static onBoarding() =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());

  static MaterialPageRoute homeScreen() =>
      MaterialPageRoute(builder: (context) => const HomeScreen());

  static MaterialPageRoute bestSelling() =>
      MaterialPageRoute(builder: (context) => const BestSellingScreen());

  static MaterialPageRoute favoriteScreen() =>
      MaterialPageRoute(builder: (context) => const FavoriteListScreen());

  static MaterialPageRoute categoryList({
    required int index,
  }) =>
      MaterialPageRoute(builder: (context) => CategoryListScreen(index: index));
  static MaterialPageRoute cartScreen() => MaterialPageRoute(
      builder: (context) => BlocBuilder<CartCubit,CartState>(
            builder: (context, state) {
              return const CartScreen();
            },
          ));

  static MaterialPageRoute productsDetails({
    required String image,
    required String productName,
    required double productPrice,
    String description = '',
  }) =>
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
                image: image,
                productName: productName,
                productPrice: productPrice,
                description: description,
              ));

  static MaterialPageRoute checkoutScreen() =>
      MaterialPageRoute(builder: (context) => const CheckoutScreen());
}
