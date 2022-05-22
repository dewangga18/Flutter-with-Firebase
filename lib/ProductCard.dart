import 'package:firebase_project/models/Product.dart';
import 'package:firebase_project/repository/DataRepository.dart';
import 'package:firebase_project/transaction/EditProduct.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final DataRepository repository = DataRepository();

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          children: <Widget>[
            Image.network(
              "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/7c2fff38-9f89-40f1-bbcf-ffbfaab5adbc/wio-8-road-running-shoes-S6jPM3.png",
              width: 100,
              height: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.productId),
                  Text("Stock : " + product.stock.toString()),
                ],
              )
            ),
            IconButton(
              onPressed: () {
                repository.deleteProduct(product);
              },
              icon: Image.asset('images/trash-can.png', width: 80, height: 80, color: Colors.red))
          ]
        ),
        onTap: () => Navigator.push<Widget>(
          context, 
          MaterialPageRoute(
            builder: (context) => EditProduct(product: product)
          )
        ),
      )
    );
  }
}
