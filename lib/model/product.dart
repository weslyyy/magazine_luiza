class Product {
  final String photo;
  final String name;
  final String description;
  final double price;
  final int installments;
  final double installmentsValue;
  final String interest;
  bool isFavorite;

  Product({
    required this.photo,
    required this.name,
    required this.description,
    required this.price,
    required this.installments,
    required this.installmentsValue,
    required this.interest,
    this.isFavorite = false,
  });
}
