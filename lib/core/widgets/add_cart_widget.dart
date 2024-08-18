
import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

class AddCartWidget extends StatelessWidget {
  const AddCartWidget({
    super.key,
    required this.addCartClick,
  });

  final Function() addCartClick;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: addCartClick,
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
