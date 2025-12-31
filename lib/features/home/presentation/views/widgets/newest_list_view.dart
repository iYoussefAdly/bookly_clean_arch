import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookItem(),
        );
      },
    );
  }
}
