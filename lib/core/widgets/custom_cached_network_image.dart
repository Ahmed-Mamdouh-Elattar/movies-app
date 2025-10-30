import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/helper/custom_cash_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({required this.image, super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: customCacheManager,
      fit: BoxFit.cover,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
