import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/cupertino.dart';

class FeatureItemListView extends StatelessWidget {
  const FeatureItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.24,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomImage(),
          );
        },
      ),
    );
  }
}
