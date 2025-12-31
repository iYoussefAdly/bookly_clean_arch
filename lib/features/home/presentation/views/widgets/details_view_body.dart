import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_details_view_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 44),
            child: Column(
              children: [
                CustomDetailsViewAppBar(),
                const SizedBox(height: 36),
                BookDetailsSection(width: width),
                Expanded(child: SizedBox(height: 46)),
                SimilarBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
