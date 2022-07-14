import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/category_enum.dart';
import '../services/firebase_dynamic_link.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton(
      {Key? key,
      required this.pageName,
      required this.categoryText,
      required this.category})
      : super(key: key);

  final String pageName;
  final String categoryText;
  final String category;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () async =>
            await FirebaseDynamicLinkServices.createDynamicLink(
                true,
                widget.pageName
                    .split(' ')
                    .map((e) => e.toLowerCase())
                    .join('-'),
                widget.category),
        child: Text(widget.categoryText),
      ),
    );
  }
}
