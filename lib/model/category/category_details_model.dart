import 'package:flowers/core/app_text.dart';

class CategoryDetailsModel{
  final String name;
  final List<ItemModel> items;

  CategoryDetailsModel({
    required this.name,
    required this.items,
  });

}

class ItemModel {
  final String name;
  final String image;
  final String description;
  final double price;
  bool isFavourite;

  ItemModel({
    required this.name,
    required this.image,
    required this.price,
    this.description = AppText.describtionText,
    this.isFavourite = false,
  });
}