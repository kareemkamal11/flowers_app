class CartItemModel {
  final String title;
  final double price;
  final String description;
  final String image;
  int totalProducts;
  double totalPrice;
  String? flavor;

  CartItemModel({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.totalProducts,
    required this.totalPrice,
    this.flavor,
  });
}
