class Product {
  int id;
  String productName;
  String productImage;
  String description;
  double price;

  Product(
      this.id,
      this.productName,
      this.productImage,
      this.description,
      this.price,
      );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['productName'],
      json['productImage'],
      json['description'],
      json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'description': description,
      'price': price,
    };
  }
}