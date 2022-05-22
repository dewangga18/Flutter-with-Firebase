import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  double price;
  int stock;
  String description;
  String productId;
  String? referenceId;

  Product(
    this.name,
    this.description,
    this.price,
    this.productId,
    this.stock,
    {this.referenceId}
  );

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final newProduct = Product.fromJson(snapshot.data() as Map<String, dynamic>);
    newProduct.referenceId = snapshot.reference.id;
    return newProduct;
  }

  Product.fromJson(Map<String, dynamic> json)
    : this.name = json['name'],
      this.price = json['price'].toDouble(),
      this.stock = json['stock'],        
      this.description = json['description'],
      this.productId = json['productId'];
 
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'stock': stock,
    'description': description,
    'productId': productId
  };
}
