import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';

List<DiscoveryCategoryModel> listDiscoveryCategory = [
  DiscoveryCategoryModel(
    name: AppText.milkshake,
    image: AssetsUtil.milkshake,
  ),
  DiscoveryCategoryModel(
    name: AppText.cafeConLeche,
    image: AssetsUtil.cafeConLecheImage,
  ),
  DiscoveryCategoryModel(
    name: AppText.espresso,
    image: AssetsUtil.espressoImage,
  ),
  DiscoveryCategoryModel(
    name: AppText.foodText,
    image: AssetsUtil.pastaImage,
  )
];
