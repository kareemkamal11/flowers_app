import 'dart:developer';

import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/model/cart/cart_item_model.dart';
import 'package:flowers/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_details_appbar.dart';
import 'widgets/product_details_buy_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.image,
    required this.productName,
    required this.productPrice,
    this.description = '',
  });

  final String image;
  final String productName;
  final double productPrice;
  final String description;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.productPrice;
  }

  int totalProducts = 1;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyles.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsAppBar(
              screenHeight,
              image: widget.image,
            ),
            ProductDetailsBuyWidget(
              screenHeight,
              productName: widget.productName,
              productPrice: widget.productPrice,
              productsCounter: counter,
              description: widget.description,
              addProduct: () {
                setState(() {
                  counter++;
                  totalProducts++;
                  totalPrice = widget.productPrice * counter; // مضاعفة السعر بعد زيادة العدد من المنتجات
                  log('totalPrice: $totalPrice');
                });
              },
              removeProduct: () {
                setState(() {
                  if (counter > 1) {
                    counter--;
                    totalProducts--;
                    totalPrice = widget.productPrice * counter;
                  }
                });
              },
              totalPrice: totalPrice,
              totalProducts: totalProducts,
              buyProduct: () {
                BlocProvider.of<CartCubit>(context).addItem(
                  CartItemModel(
                      title: widget.productName,
                      price: widget.productPrice,
                      description: widget.description,
                      image: widget.image,
                      totalProducts: totalProducts,
                      totalPrice: totalPrice),
                );
                Navigator.of(context)
                    .pushReplacement(AppNavigator.cartScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
