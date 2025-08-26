class ProductModel {
  final int id;
  final String title, describtion, category, image;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.describtion,
    required this.category,
    required this.image,
  });
  factory ProductModel.fromJson(dynamic data) {
    return ProductModel(
      id: data['id'],
      title: data['title']!,
      price: double.tryParse(data['price'].toString()) ?? 0.00,
      describtion: data['description'] ?? '',
      category: data['category'],
      image: data['image'],
    );
  }
}
