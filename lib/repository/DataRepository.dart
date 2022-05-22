import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/Product.dart';

class DataRepository {
  final CollectionReference collection = FirebaseFirestore.instance.collection('products');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addProduct(Product product) {
    return collection.add(product.toJson());
  }

  void updateProduct(Product product) async {
    await collection.doc(product.referenceId).update(product.toJson());
  }

  void deleteProduct(Product product) async {
    await collection.doc(product.referenceId).delete();
  }
}
