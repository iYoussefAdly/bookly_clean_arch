import 'package:bookly_clean_arch/core/utils/functions/show_snack_bar.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/feature_item_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/featured_item_list_view_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedItemListViewBlocBuilder extends StatefulWidget {
  const FeaturedItemListViewBlocBuilder({super.key});

  @override
  State<FeaturedItemListViewBlocBuilder> createState() =>
      _FeaturedItemListViewBlocBuilderState();
}

class _FeaturedItemListViewBlocBuilderState
    extends State<FeaturedItemListViewBlocBuilder> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (BuildContext context, FeaturedBooksState state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeatureItemListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: FeaturedItemListViewLoadingIndicator());
        }
      },
    );
  }
}
