// ignore_for_file: file_names

import 'package:firebase_project/models/Product.dart';
import 'package:firebase_project/repository/DataRepository.dart';
import "package:flutter/material.dart";

class EditProduct extends StatelessWidget {
  final inputProductId = TextEditingController();
  final inputProductName = TextEditingController();
  final inputPrice = TextEditingController();
  final inputStock = TextEditingController();
  final inputDescription = TextEditingController();
  final DataRepository repository = DataRepository();
  final Product product;

  EditProduct({Key? key, required this.product}) : super(key: key);
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              }
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Product Information',
                        style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide( width: 1.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const Text(
                        'Product Image',
                        style: TextStyle(fontSize: 15)
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        height: 200,
                        child: const Center(
                          child: Icon(Icons.add, size: 50, color: Colors.blue),
                          ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border: Border.all(width: 5, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const Text(
                        'Product Name',
                         style: TextStyle(fontSize: 15)
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: inputProductName..text = product.name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Product name",
                          ),
                        ),
                      ),
                      const Text(
                        'Product ID',
                        style: TextStyle(fontSize: 15)
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: inputProductId..text = product.productId,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Product id",
                          ),
                        ),
                      ),
                      const Text('Price', style: TextStyle(fontSize: 15)),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: inputPrice..text = product.price.toString(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "1000000",
                          ),
                        ),
                      ),
                      const Text('Stock', style: TextStyle(fontSize: 15)),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: inputStock..text = product.stock.toString(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "10",
                          ),
                        ),
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(fontSize: 15)
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: inputDescription..text = product.description,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a description ...",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.red)
                              )
                            )
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            product.name = inputProductName.text;
                            product.price = double.parse(inputPrice.text);
                            product.stock = int.parse(inputStock.text);
                            product.description = inputDescription.text;
                            product.productId = inputProductId.text;
                            repository.updateProduct(product);
                          },
                          child: const Text("Update Product"),
                        )
                      ),
                    ],
                  ),
                )
              )
            )
          ),
    );
  }
}
