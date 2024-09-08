// ignore: unused_import

import 'package:flowers/core/app_text.dart';
import 'package:flowers/view/utils/search_item_widget.dart';
import 'package:flutter/material.dart';

class ListSearchWidget extends StatelessWidget {
  const ListSearchWidget({
    super.key,
    required this.searchList,
  });

  final List<dynamic> searchList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 50),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: searchList.length,
      itemBuilder: (context, index) {
        return SearchItemWidget(
          image: searchList[index].image,
          name: searchList[index].name,
          description: AppText.describtionText,
          flavor: searchList[index].flavor,
          price: searchList[index].price,
        );
      },
    );
  }
}
