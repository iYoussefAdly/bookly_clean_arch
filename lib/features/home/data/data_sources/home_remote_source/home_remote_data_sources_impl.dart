import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourcesImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=subject:programming",
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }
  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest",
    );
    List<BookEntity> books = getBooksList(data);
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
