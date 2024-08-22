import 'package:flowers/view/best_selling/best_selling_screen.dart';
import 'package:flowers/view/cart/cart_screen.dart';
import 'package:flowers/view/cart/checkout_screen.dart';
import 'package:flowers/view/category_list/category_list_screen.dart';
import 'package:flowers/view/onboard/onboard_view.dart';
import 'package:flowers/view/product_details/product_details_screen.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/home/home_screen.dart';

class AppNavigator {
  static onBoarding() =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());

  static homeScreen() => MaterialPageRoute(
      builder: (context) => BlocProvider(
            create: (context) => HomeScreenCubit(),
            child: const HomeScreen(),
          ));

  static bestSelling() =>
      MaterialPageRoute(builder: (context) => const BestSellingScreen());

  static categoryList() =>
      MaterialPageRoute(builder: (context) => const CategoryListScreen());
  static cartScreen() =>
      MaterialPageRoute(builder: (context) => const CartScreen());
  static productsDetails() =>
      MaterialPageRoute(builder: (context) => const ProductDetailsScreen());

  static checkoutScreen() =>
      MaterialPageRoute(builder: (context) => const CheckoutScreen());
}
