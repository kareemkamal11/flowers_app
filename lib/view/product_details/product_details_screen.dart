import 'package:flowers/core/app_styles.dart';
import 'package:flowers/view_models/product_details_cubit/counter_cubit.dart';
import 'package:flowers/view_models/product_details_cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_details_appbar.dart';
import 'widgets/product_details_buy_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        final productsCubit = BlocProvider.of<CounterCubit>(context);
        return Scaffold(
          backgroundColor: AppStyles.secondaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProductDetailsAppBar(
                  screenHeight: screenHeight,
                ),
                ProductDetailsBuyWidget(
                  screenHeight: screenHeight,
                  productsCubit: productsCubit,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

