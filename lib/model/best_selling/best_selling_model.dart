class BestSellingModel {
  final String name;
  final String image;
  final double price;
  bool isFavourite;

  BestSellingModel({
    required this.name,
    required this.image,
    required this.price,
    this.isFavourite = false,
  });
}
