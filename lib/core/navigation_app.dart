import 'package:flowers/view/best_selling/best_selling_screen.dart';
import 'package:flowers/view/cart/cart_screen.dart';
import 'package:flowers/view/cart/checkout_screen.dart';
import 'package:flowers/view/category_list/category_list_screen.dart';
import 'package:flowers/view/onboard/onboard_view.dart';
import 'package:flowers/view/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../view/favorite_list_screen.dart';
import '../view/home/home_screen.dart';

class AppNavigator {
  static onBoarding() =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());

  static MaterialPageRoute homeScreen() => MaterialPageRoute(
      builder: (context) => const HomeScreen());

  static MaterialPageRoute bestSelling() =>
      MaterialPageRoute(builder: (context) => const BestSellingScreen());

  static MaterialPageRoute favoriteScreen() =>
      MaterialPageRoute(builder: (context) => const FavoriteListScreen());

  static MaterialPageRoute categoryList() =>
      MaterialPageRoute(builder: (context) => const CategoryListScreen());
  static MaterialPageRoute cartScreen() =>
      MaterialPageRoute(builder: (context) => const CartScreen());
  static MaterialPageRoute productsDetails() =>
      MaterialPageRoute(builder: (context) => const ProductDetailsScreen());

  static MaterialPageRoute checkoutScreen() =>
      MaterialPageRoute(builder: (context) => const CheckoutScreen());
}
