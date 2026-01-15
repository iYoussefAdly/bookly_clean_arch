import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/featured_item_list_view_bloc_builder.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:flutter/cupertino.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 40),
                FeaturedItemListViewBlocBuilder(),
                SizedBox(height: 38),
                Text(
                  "Newest",
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: NewestListView(),
          ),
        ),
      ],
    );
  }
}


