import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}
