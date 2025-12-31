import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 40),
          Text(
            "Search result",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
