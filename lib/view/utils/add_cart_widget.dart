
import 'package:flowers/core/app_route.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCartWidget extends StatelessWidget {
  const AddCartWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRoute.productDetails);
        },
        splashColor: Colors.transparent,
        child: Container(
          width: 35,
          height: 35,
          decoration: ShapeDecoration(
            color: AppStyles.mainColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
