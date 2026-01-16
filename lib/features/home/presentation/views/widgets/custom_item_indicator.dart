import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomItemIndicator extends StatelessWidget {
  const CustomItemIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}