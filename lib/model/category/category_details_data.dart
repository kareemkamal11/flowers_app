import 'package:flowers/core/app_text.dart';
import 'package:flowers/model/category/category_details_model.dart';

import 'category_lists_items.dart';


List<CategoryDetailsModel> listCategoryDetails = [
  CategoryDetailsModel(
    name: AppText.milkshake,
    items: milkshakeItem,
  ),
  CategoryDetailsModel(
    name: AppText.cafeConLeche,
    items: cafeConLecheItem,
  ),
  CategoryDetailsModel(
    name: AppText.espresso,
    items: espressoItem,
  ),
  CategoryDetailsModel(
    name: AppText.foodText,
    items: foodItem,
  ),
];
