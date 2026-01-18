import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.authorName, required this.rating,
  });
  final String image;
  final String title;
  final num price;
  final String authorName;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRouter.kDetailsView),
        child: SizedBox(
          height: 160,
          child: Row(
            children: [
              CustomImage(image: image),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Text(
                        title,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      authorName,
                      style: Styles.textStyle14.copyWith(
                        color: Color(0xffB1AFB6),
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$price €",
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          BookRatingItem(rating: rating),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
