

class Products {
  final String name;

  final String image;
  final num price;

  Products({required this.name, required this.image, required this.price});
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}
