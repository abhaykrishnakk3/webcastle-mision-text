import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextAndViewAll extends StatelessWidget {
  String name;
   TextAndViewAll({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
       const Text(
          "View All",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
