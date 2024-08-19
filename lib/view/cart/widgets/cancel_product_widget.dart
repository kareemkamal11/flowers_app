import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';


class CancelProductWidget extends StatelessWidget {
  const CancelProductWidget({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 30,
        decoration: ShapeDecoration(
          color: AppStyles.secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(100),
            ),
          ),
        ),
        child: Icon(
          Icons.close_rounded,
          color: AppStyles.mainColor,
          size: 25,
        ),
      ),
    );
  }
}
