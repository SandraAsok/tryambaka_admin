class Products {
  final String productName;
  final String subName;
  final String category;
  final String quantity;
  final String price;
  final String color;
  final String description;
  final String type;
  final List? imageList;
  final String? id;

  Products({
    required this.productName,
    required this.subName,
    required this.category,
    required this.quantity,
    required this.price,
    required this.color,
    required this.description,
    required this.type,
    this.imageList,
    this.id,
  });
}
