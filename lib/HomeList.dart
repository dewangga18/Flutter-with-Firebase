// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/ProductCard.dart';
import 'package:firebase_project/models/Product.dart';
import 'package:firebase_project/repository/DataRepository.dart';
import 'package:firebase_project/transaction/AddProduct.dart';
import 'package:flutter/material.dart';


class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final DataRepository repository = DataRepository();
  final boldStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: repository.getStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();
          return _buildList(context, snapshot.data?.docs ?? []);
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _addProduct();
        },
        tooltip: 'Add method',
        icon: const Icon(Icons.add),
        label: const Text("New Product"),
      ), 
    );
  }

  void _addProduct() {
    Navigator.push<Widget>(
      context,
      MaterialPageRoute(builder: (context) => AddProduct()),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final product = Product.fromSnapshot(snapshot);
    return ProductCard(product: product);
  }
}
