import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_item_indicator.dart';
import 'package:flutter/cupertino.dart';

class NewestListViewLoadingIndicator extends StatelessWidget {
  const NewestListViewLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookItemLoadingIndicator()
        );
      },
    );
  }
}