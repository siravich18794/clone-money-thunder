import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String tag;

  const CategoryTag({Key? key, required this.tag}) : super(key: key);

  Text textTag(String s) {
    return Text(s,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.category_rounded, size: 20, color: Colors.blue),
        const SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: tag == 'shirt'
                ? Colors.blue
                : tag == 'pants'
                    ? const Color.fromARGB(255, 104, 185, 107)
                    : Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          child: tag == 'shirt'
              ? textTag('Shirt')
              : tag == 'pants'
                  ? textTag('Pants')
                  : textTag('Shoes'),
        ),
      ],
    );
  }
}
