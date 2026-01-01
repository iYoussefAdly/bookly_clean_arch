import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/cupertino.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: CustomImage(),
        ),
        SizedBox(height: 37),
        Text("The Jungle Book", style: Styles.textStyle30),
        SizedBox(height: 3),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 12),
        BookRatingItem(mainAxisAlignment: MainAxisAlignment.center),
        SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BooksAction(),
        ),
      ],
    );
  }
}
