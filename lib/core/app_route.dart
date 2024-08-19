import 'package:flowers/view/category_list/category_list_screen.dart';
import 'package:flowers/view_models/product_details_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../view/best_selling/best_selling_screen.dart';
import '../view/cart/cart_screen.dart';
import '../view/cart/order_confirm_screen.dart';
import '../view/home/home_screen.dart';
import '../view/onboard/onboard_view.dart';
import '../view/product_details/product_details_screen.dart';
import '../view/splash/splash_veiw.dart';

class AppRoute {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String bestSelling = '/bestSelling';
  static const String categorylist = '/categorylist';
  static const String productDetails = '/productDetails';
  static const String cart = '/cart';
  static const String confirmOrder = '/confirmOrder';

  static final routerConfig = GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const OnboardView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: bestSelling,
      builder: (context, state) => const BestSellingScreen(),
    ),
    GoRoute(
      path: categorylist,
      builder: (context, state) => const CategoryListScreen(),
    ),
    GoRoute(
      path: productDetails,
      builder: (context, state) => BlocProvider(
        create: (context) => CounterCubit(),
        child: const ProductDetailsScreen(),
      ),
    ),
    GoRoute(
      path: cart,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
        path: confirmOrder,
        builder: (context, state) => const OrderConfirmScreen()),
  ]);
}
