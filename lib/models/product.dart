class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final String category;
  final List<String> imgUrl;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.imgUrl,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      imgUrl: json["imgUrl"],
    );
  }

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
      };
}
