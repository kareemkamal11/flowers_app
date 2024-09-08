import 'dart:math';

import 'package:flowers/core/app_text.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/model/best_selling/best_selling_model.dart';

List<String> flavor = [
  'Vanilla',
  'Caramel',
  'Hazelnut',
  'Mocha',
  'Cinnamon',
  'Pumpkin',
  'Coconut',
  'Almond',
  'Peppermint',
  'Maple',
  'Butterscotch',
  'Toffee',
  'Irish Cream',
  'Raspberry',
  'Blueberry',
  'Strawberry',
  'Cherry',
  'Orange',
];


List<BestSellingModel> bestSellingData = [
  BestSellingModel(
    name: AppText.cafeBombon,
    image: AssetsUtil.cafeBombonImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 5.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.cafeConLeche,
    image: AssetsUtil.cafeConLecheImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 6.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.cafeCortado,
    image: AssetsUtil.cafeCortadoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 7.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.cafeCubano,
    image: AssetsUtil.cafeCubanoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 8.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.macchiato,
    image: AssetsUtil.macchiatoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 9.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.mocha,
    image: AssetsUtil.mochaImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 10.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.ristretto,
    image: AssetsUtil.ristrettoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 11.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.americano,
    image: AssetsUtil.americanoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 12.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.corretto,
    image: AssetsUtil.correttoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 13.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.espresso,
    image: AssetsUtil.espressoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 14.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.espressoRomano,
    image: AssetsUtil.espressoRomanoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 15.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.galao,
    image: AssetsUtil.galaoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 16.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.latte,
    image: AssetsUtil.latteImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 17.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.lungo,
    image: AssetsUtil.lungoImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 18.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.cake,
    image: AssetsUtil.cakeImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 19.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.donut,
    image: AssetsUtil.donutImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 20.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.friedEggs,
    image: AssetsUtil.friedEggsImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 21.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.muffin,
    image: AssetsUtil.muffinImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 22.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.pasta,
    image: AssetsUtil.pastaImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 23.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.pizza,
    image: AssetsUtil.pizzaImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 24.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.salad,
    image: AssetsUtil.saladImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 25.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.sandwich,
    image: AssetsUtil.sandwichImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 26.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.soup,
    image: AssetsUtil.soupImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 27.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.sushi,
    image: AssetsUtil.sushiImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 28.99,
    isFavourite: false,
  ),
  BestSellingModel(
    name: AppText.pasta,
    image: AssetsUtil.pataImage,
    flavor: flavor[Random().nextInt(flavor.length)],
    price: 29.99,
    isFavourite: false,
  ),
];
