import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          // في حالة الخطأ
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 32,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
