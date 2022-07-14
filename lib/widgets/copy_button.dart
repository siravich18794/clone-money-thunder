import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/firebase_dynamic_link.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({Key? key, required this.category, required this.productId})
      : super(key: key);

  final String category;
  final String productId;

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 180),
      child: IconButton(
        icon: Icon(
          Icons.copy,
          color: iconColor,
        ),
        onPressed: () async {
          setState(() {
            iconColor = Colors.red;
          });

          await FirebaseDynamicLinkServices.createDynamicLink(
              true, 'men-page', widget.category, widget.productId);

          await Future.delayed(
              Duration(seconds: 1),
              () => {
                    setState(() {
                      iconColor = Colors.black;
                    })
                  });
        },
      ),
    );
  }
}
