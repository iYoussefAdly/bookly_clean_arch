import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookRatingItem extends StatelessWidget {
  const BookRatingItem({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(Icons.star, color: Color(0xffF5D44C), size: 20),
        SizedBox(width: 6),
        Text(
          "4.8",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
        ),
        SizedBox(width: 7),
        Text(
          "(2390)",
          style: Styles.textStyle14.copyWith(color: Color(0xff83808A)),
        ),
      ],
    );
  }
}
