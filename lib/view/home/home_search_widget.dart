import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'search here ..',
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
            width: 36.51,
            height: 40,
            decoration: ShapeDecoration(
              color: AppStyles.secondaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            child: const Icon(Icons.search)),
      ],
    );
  }
}
