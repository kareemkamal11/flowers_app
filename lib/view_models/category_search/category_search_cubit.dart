import 'package:flowers/model/category/category_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_search_state.dart';

class CategorySearchCubit extends Cubit<CategorySearchState> {
  CategorySearchCubit() : super(CategorySearchInitial());

  List<dynamic> resultSearchList = [];

  final TextEditingController searchController = TextEditingController();

  String searchWord = "";

  onSaved(String value) {
    searchWord = value.trim();
    if (searchWord.isEmpty) {
      removeWord();
    }
    emit(CategorySearchSaved());
  }

  removeWord() {
    searchWord = "";
    searchController.clear();
    resultSearchList.clear();
    actionSearch = false;
    emit(CategorySearchRemoved());
  }

  bool actionSearch = false;

  void searchAction(List<ItemModel> items) {
    if (searchWord.trim().isNotEmpty) {
      resultSearchList.clear();
      appSearch(searchWord, items);
      actionSearch = true;
    }
    emit(CategorySearchAction());
  }

  void appSearch(String searchQuery, List<ItemModel> combinedList) {
    if (searchQuery.isEmpty) {
      return;
    }
    resultSearchList.addAll(combinedList.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.price.toString().contains(searchQuery) ||
          (item.flavor?.toLowerCase().contains(searchQuery.toLowerCase()) ??
              false);
    }).toList());

    emit(CategorySearchAction());
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
