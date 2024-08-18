import 'package:flutter/material.dart';

import 'widgets/category_list_body.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CategoryListBody(),
      ),
    );
  }
}


