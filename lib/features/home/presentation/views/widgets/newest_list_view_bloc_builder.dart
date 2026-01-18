import 'package:bookly_clean_arch/core/utils/functions/show_snack_bar.dart';
import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_list_view_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatefulWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  State<NewestListViewBlocBuilder> createState() =>
      _NewestListViewBlocBuilderState();
}

class _NewestListViewBlocBuilderState extends State<NewestListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (BuildContext context, NewestBooksState state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return NewestListView(books: books);
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return CustomFadingWidget(child: NewestListViewLoadingIndicator());
        }
      },
    );
  }
}
