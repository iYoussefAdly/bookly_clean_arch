import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureItemListView extends StatefulWidget {
  const FeatureItemListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<FeatureItemListView> createState() => _FeatureItemListViewState();
}

class _FeatureItemListViewState extends State<FeatureItemListView> {
  final ScrollController _scrollController = ScrollController();
  bool _hasReached70Percent = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;

      final current = _scrollController.position.pixels;
      final max = _scrollController.position.maxScrollExtent;

      if (max <= 0) return;

      final progress = current / max;

      if (progress >= 0.7 && !_hasReached70Percent) {
        _hasReached70Percent = true;

        context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomImage(
              image: widget.books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
