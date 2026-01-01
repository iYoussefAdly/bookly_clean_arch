import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) {
    //here we make the permsions of user
    return homeRepo.fetchNewestBooks();
  }
}
