class BestSellingModel {
  final String name;
  final String image;
  final String flavor;
  final String price;
  bool isFavourite;

  BestSellingModel({
    required this.name,
    required this.image,
    required this.flavor,
    required this.price,
    this.isFavourite = false,
  });
}
