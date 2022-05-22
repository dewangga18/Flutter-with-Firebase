// ignore_for_file: file_names
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
    : name = json['name'],
      price = json['price'].toDouble(),
      stock = json['stock'],        
      description = json['description'],
      productId = json['productId'];
 
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'stock': stock,
    'description': description,
    'productId': productId
  };
}
