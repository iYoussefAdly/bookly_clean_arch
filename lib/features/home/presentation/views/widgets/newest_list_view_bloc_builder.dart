import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatelessWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestListView();
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
