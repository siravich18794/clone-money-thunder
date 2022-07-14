// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../components/product_card.dart';
import '../constants/category_enum.dart';
import '../data/product_data.dart';
import '../widgets/category_button.dart';
import 'product_detail_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.pageName, this.category})
      : super(key: key);

  final String pageName;
  final String? category;

  // Filter Product depend on Category
  ListView filteredProduct([String? filteredCategory]) {
    final List<Map<String, dynamic>> result;

    if (filteredCategory != null) {
      final List<Map<String, dynamic>> products = ProductData.productList
          .where((e) => e['category'] == filteredCategory)
          .toList();
      result = products;
    } else {
      result = ProductData.productList;
    }

    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Container(
            child: GestureDetector(
              onTap: () {
                //print(ProductData.productList[2]['price'] + index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                              productName: result[index]['name'],
                              price: result[index]['price'],
                              imageUrl: result[index]['imageUrl'],
                              productId: result[index]['id'],
                              category: result[index]['category'],
                            )));
              },
              child: ProductCard(
                productName: result[index]['name'],
                price: result[index]['price'],
                categoryTag: result[index]['category'],
                imageUrl: result[index]['imageUrl'],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: Text(pageName),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    child: filteredProduct(category),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryButton(
                      pageName: pageName,
                      categoryText: 'Shirt Link',
                      category: Category.shirt.name,
                    ),
                    CategoryButton(
                      pageName: pageName,
                      categoryText: 'Pants Link',
                      category: Category.pants.name,
                    ),
                    CategoryButton(
                      pageName: pageName,
                      categoryText: 'Shoes Link',
                      category: Category.shoes.name,
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
