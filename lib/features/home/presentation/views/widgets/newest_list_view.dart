import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookItem(image: books[index].image!, title: books[index].title, price: books[index].price!, authorName: books[index].authorName ?? '', rating: books[index].rating?.toDouble() ?? 0.0),
        );
      },
    );
  }
}
