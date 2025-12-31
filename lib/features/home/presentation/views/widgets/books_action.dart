import 'package:bookly_clean_arch/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          backGroundColor: Colors.white,
          textColor: Colors.black,
          text: '19.99€',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          fontWeight: FontWeight.w900,
        ),
        CustomButton(
          backGroundColor: Color(0xffE77D5F),
          textColor: Colors.white,
          text: 'Free preview',
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
