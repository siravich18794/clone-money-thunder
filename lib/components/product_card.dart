// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets/category_tag.dart';
import '../constants/category_enum.dart';

import 'dart:math' as math;

class ProductCard extends StatefulWidget {
  final String productName;
  final String categoryTag;
  final int price;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.categoryTag,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                // Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(0.5),
                //
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 210, 210, 210),
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 0.2,
                    spreadRadius: 0.5,
                  ),
                ]),
            child: Image.network(widget.imageUrl, fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                print('Success');
                return child;
              } else {
                print('Loading...');
                return Center(child: CircularProgressIndicator());
              }
            }),
          ),
          Container(
            height: 100,
            width: 225,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 210, 210, 210),
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 0.2,
                    spreadRadius: 0.5,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productName,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 20, color: Colors.blue),
                    Text(widget.price.toString()),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Expanded(child: CategoryTag(tag: widget.categoryTag)),
                    // Expanded(
                    //   child: ElevatedButton(
                    //     // style: ButtonStyle(fixedSize: Size),
                    //     onPressed: () => {
                    //       showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //               // Retrieve the text the that user has entered by using the
                    //               // TextEditingController.
                    //               content: Text("Buy this"));
                    //         },
                    //       )
                    //     },
                    //     child: Text(
                    //       'Buy now',
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    //   // child: Container(
                    //   //   padding: EdgeInsets.all(5),
                    //   //   alignment: Alignment.center,
                    //   //   child: Text(
                    //   //     'Buy now',
                    //   //     style: TextStyle(
                    //   //         color: Colors.white, fontWeight: FontWeight.bold),
                    //   //   ),
                    //   //   decoration: BoxDecoration(
                    //   //       borderRadius: BorderRadius.circular(5),
                    //   //       color: Color.fromARGB(255, 255, 171, 61)),
                    //   // ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
