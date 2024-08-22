import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';
import 'package:flowers/view/utils/seeall_widget.dart';
import 'package:flutter/material.dart';

class DiscoverCategoriesWidget extends StatelessWidget {
  const DiscoverCategoriesWidget({
    super.key,
    required this.listDiscoveryCategory,
  });

  final List<DiscoveryCategoryModel> listDiscoveryCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppText.discover, style: AppStyles.robotoStyle),
            const Spacer(),
            SeeallWidget(onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppStyles.secondaryColor.withOpacity(0.8),
                    content: Container(
                      height: 80,
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        AppText.noMoreCategory,
                        style: AppStyles.pangolinStyle,
                      ),
                    ),
                  );
                },
              );
            })
          ],
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: listDiscoveryCategory.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 30);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap: () {
                    
                  },
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
                          listDiscoveryCategory[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        listDiscoveryCategory[index].name,
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
          ),
        ),
      ],
    );
  }
}
