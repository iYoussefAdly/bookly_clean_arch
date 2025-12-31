import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDetailsViewAppBar extends StatelessWidget {
  const CustomDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        IconButton(
          onPressed: () {
            
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
