import 'package:firebase_project/models/Product.dart';
import 'package:firebase_project/repository/DataRepository.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  final inputProductId = TextEditingController();
  final inputProductName = TextEditingController();
  final inputPrice = TextEditingController();
  final inputStock = TextEditingController();
  final inputDescription = TextEditingController();
  final DataRepository repository = DataRepository();
  late Product product;

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black))),
                    ),
                    const Text(
                      'Product Image',
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      height: 200,
                      child: const Center(
                        child: Icon(Icons.add, size: 50, color: Colors.blue),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(width: 5, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const Text(
                      'Product Name',
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: inputProductName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Product name"),
                      ),
                    ),
                    const Text('Product ID', style: TextStyle(fontSize: 15)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: inputProductId,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Product id",
                        ),
                      ),
                    ),
                    const Text('Price', style: TextStyle(fontSize: 15)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: inputPrice,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "1000000",
                        ),
                      ),
                    ),
                    const Text('Stock', style: TextStyle(fontSize: 15)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: inputStock,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "10",
                        ),
                      ),
                    ),
                    const Text('Description', style: TextStyle(fontSize: 15)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: inputDescription,
                        decoration: InputDecoration(
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
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.blue)))),
                          onPressed: () {
                            Navigator.of(context).pop();
                            product = Product(
                                inputProductName.text,
                                inputDescription.text,
                                double.parse(inputPrice.text),
                                inputProductId.text,
                                int.parse(inputStock.text));
                            repository.addProduct(product);
                          },
                          child: const Text("Add Product"),
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
