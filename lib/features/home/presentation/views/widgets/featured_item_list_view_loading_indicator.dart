import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_item_indicator.dart';
import 'package:flutter/cupertino.dart';

class FeaturedItemListViewLoadingIndicator extends StatelessWidget {
  const FeaturedItemListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFadingWidget(child: CustomItemIndicator()),
          );
        },
      ),
    );
  }
}