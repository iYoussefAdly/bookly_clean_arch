import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // يقدر يستخدم الفانكشن دي ولا لأ user  هل ال  permision  هنا بنشوف ال 
    return homeRepo.fetchFeaturedBooks();
  }
}
