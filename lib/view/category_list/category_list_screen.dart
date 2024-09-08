import 'package:flowers/model/category/category_details_data.dart';
import 'package:flowers/view_models/category_search/category_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/category_list_body.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorySearchCubit(),
      child: SafeArea(
        child: Scaffold(
          body: CategoryListBody(
            title: listCategoryDetails[index].name,
            items: listCategoryDetails[index].items,
          ),
        ),
      ),
    );
  }
}
