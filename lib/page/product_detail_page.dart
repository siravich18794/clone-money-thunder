import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/copy_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage(
      {Key? key,
      required this.productName,
      required this.price,
      required this.imageUrl,
      required this.productId,
      required this.category})
      : super(key: key);

  final String productName;
  final int price;
  final String imageUrl;
  final String productId;
  final String category;

  String generateRandomString(int length) {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Container(
          // padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(child: LinearProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(26, 255, 255, 255),
                      //borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 137, 137, 137)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 237, 236, 236),
                          offset: const Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.attach_money_rounded),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              price.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Expanded(
                              child: CopyButton(
                            category: category,
                            productId: productId,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          productName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(generateRandomString(300)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
