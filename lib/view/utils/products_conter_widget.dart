import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

class ProductsConter extends StatelessWidget {
  const ProductsConter({
    super.key,
    required this.products,
    required this.addProduct,
    required this.removeProduct,
  });

  final int products;

  final Function() addProduct;
  final Function() removeProduct;

  Widget counterButton(IconData icon, {required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        width: 35,
        height: 35,
        decoration: const ShapeDecoration(
          color: Color(0xFF3C312F),
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 35,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: [
            AppStyles.secondaryColor.withOpacity(0.8),
            AppStyles.secondaryColor.withOpacity(0.3)
          ],
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          counterButton(
            Icons.remove,
            onTap: removeProduct,
          ),
          Text(
            products.toString(),
            style: AppStyles.robotoStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          counterButton(
            Icons.add,
            onTap: addProduct,
          ),
        ],
      ),
    );
  }
}
