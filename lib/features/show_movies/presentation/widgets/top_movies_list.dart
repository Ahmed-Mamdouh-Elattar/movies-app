import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/routing/page_name.dart';

class TopMoviesList extends StatelessWidget {
  const TopMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: kPadding),
      scrollDirection: Axis.horizontal,

      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () => context.push(PageName.details),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 144.61 / 210,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: 'https://picsum.photos/seed/${key}_$index/200/300',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
