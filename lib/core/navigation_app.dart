import 'package:flowers/view/best_selling/best_selling_screen.dart';
import 'package:flowers/view/cart/cart_screen.dart';
import 'package:flowers/view/cart/checkout_screen.dart';
import 'package:flowers/view/category_list/category_list_screen.dart';
import 'package:flowers/view/onboard/onboard_view.dart';
import 'package:flowers/view/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../view/favorite/favorite_list_screen.dart';
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
  static MaterialPageRoute cartScreen() =>
      MaterialPageRoute(builder: (context) => const CartScreen());

  static MaterialPageRoute productsDetails({
    required String image,
    required String productName,
    required double productPrice,
    String description = '',
    String? flavor,
  }) =>
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
                image: image,
                productName: productName,
                productPrice: productPrice,
                description: description,
                flavor: flavor,
              ));

  static MaterialPageRoute checkoutScreen() =>
      MaterialPageRoute(builder: (context) => const CheckoutScreen());
}
