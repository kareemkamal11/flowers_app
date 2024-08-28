import 'package:flowers/model/best_selling/best_selling_data.dart';
import 'package:flowers/model/best_selling/best_selling_model.dart';
import 'package:flowers/model/best_selling/favorite_best_selling.dart';
import 'package:flowers/model/category/discovery_category/descovery_category_data.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  List<DiscoveryCategoryModel> cListDiscoveryCategory = listDiscoveryCategory;

  List<BestSellingModel> cListBestSelling = bestSellingData;

  // add favorite list
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
}
