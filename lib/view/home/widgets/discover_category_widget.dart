import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/core/widgets/seeall_widget.dart';
import 'package:flutter/material.dart';

class DiscoverCategoriesWidget extends StatelessWidget {
  const DiscoverCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppText.discover,
              style: AppStyles.robotoStyle
            ),
            const Spacer(),
            SeeallWidget(onTap: (){})
          ],
        ),
        Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 30);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFFFBE7E4), Color(0x00FBE7E4)],
                          ),
                          shape: OvalBorder(),
                        ),
                        child: Image.asset(
                          AssetsUtil.milkshake,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppText.milkshake,
                        style: AppStyles.robotoStyle.copyWith(
                          color: AppStyles.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
