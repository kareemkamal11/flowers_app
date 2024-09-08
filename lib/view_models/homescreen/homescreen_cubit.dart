import 'package:flowers/model/best_selling/best_selling_data.dart';
import 'package:flowers/model/best_selling/best_selling_model.dart';
import 'package:flowers/model/best_selling/favorite_best_selling.dart';
import 'package:flowers/model/category/category_lists_items.dart';
import 'package:flowers/model/category/discovery_category/descovery_category_data.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  List<DiscoveryCategoryModel> cListDiscoveryCategory = listDiscoveryCategory;

  List<BestSellingModel> cListBestSelling = bestSellingData;

  List<BestSellingModel> cListFavourite = listFavourite;

  void updateFavourite(int index) {
    cListBestSelling[index].isFavourite = !cListBestSelling[index].isFavourite;
    if (cListBestSelling[index].isFavourite) {
      cListFavourite.add(cListBestSelling[index]);
    } else {
      cListFavourite.remove(cListBestSelling[index]);
    }
    emit(FavoriteChanged());
  }

  void removeFavourite(int index) {
    cListFavourite[index].isFavourite = false;
    cListFavourite.removeAt(index);
    emit(FavoriteChanged());
  }

  List<dynamic> resultSearchList = [];

  final TextEditingController searchController = TextEditingController();

  String searchWord = "";

  onSaved(String value) {
    searchWord = value.trim();
    if (searchWord.isEmpty) {
      removeWord();
    }
    emit(SearchHomeScreen());
  }

  removeWord() {
    searchWord = "";
    searchController.clear();
    resultSearchList.clear();
    actionSearch = false;
    emit(SearchHomeScreen());
  }

  bool actionSearch = false;

  void searchAction() {
    if (searchWord.trim().isNotEmpty) {
      resultSearchList.clear();
      appSearch(searchWord);
      actionSearch = true;
    }
    emit(SearchHomeScreen());
  }

  void appSearch(String searchQuery) {
    if (searchQuery.isEmpty) {
      return;
    }
    List<dynamic> combinedList = [
      ...bestSellingData,
      ...milkshakeItem,
      ...cafeConLecheItem,
      ...espressoItem,
      ...foodItem
    ];

    resultSearchList.addAll(combinedList.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.price.toString().contains(searchQuery) ||
          (item.flavor?.toLowerCase().contains(searchQuery.toLowerCase()) ??
              false);
    }).toList());

    emit(SearchHomeScreen());
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
