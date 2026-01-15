import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> saveBooks(List<BookEntity> books,String boxName) async {
    var box = await Hive.openBox<BookEntity>(boxName);
    box.addAll(books);
  }