import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/functions/save_books.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourcesImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=subject:programming&startIndex=${pageNumber*10}",
    );
    List<BookEntity> books = getBooksList(data);
    await saveBooks(books, kFeaturedBooks);
    return books;
  }
  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0}) async {
    var data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&q=subject:ai&Sorting=newest&startIndex=${pageNumber*10}",
    );
    List<BookEntity> books = getBooksList(data);
    await saveBooks(books, kNewestBooks);
    return books;
  }
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data["items"]) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
