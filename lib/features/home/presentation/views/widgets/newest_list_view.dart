import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_item.dart';

class NewestListView extends StatefulWidget {
  const NewestListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<NewestListView> createState() => _NewestListViewState();
}
class _NewestListViewState extends State<NewestListView> {
  final ScrollController _scrollController = ScrollController();
  bool _hasReached70Percent = false;
  bool isLoading = false;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (!_scrollController.hasClients) return;
      final current = _scrollController.position.pixels;
      final max = _scrollController.position.maxScrollExtent;
      if (max <= 0) return;
      final progress = current / max;
      if (progress >= 0.7 && !_hasReached70Percent) {
        _hasReached70Percent = true;
        if (!isLoading) {
          isLoading = true;
          await context.read<NewestBooksCubit>().fetchNewestBooks(
            pageNumber: nextPage++,
          );
          isLoading = false;
        }
      }
      // reset لما المستخدم يرجع لفوق
      if (progress < 0.7) {
        _hasReached70Percent = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookItem(
            image: widget.books[index].image!,
            title: widget.books[index].title,
            price: widget.books[index].price!,
            authorName: widget.books[index].authorName ?? '',
            rating: widget.books[index].rating?.toDouble() ?? 0.0,
          ),
        );
      },
    );
  }
}
