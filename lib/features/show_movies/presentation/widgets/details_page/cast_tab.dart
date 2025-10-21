
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/constants.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding - 14,
        vertical: 36,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 120 / 123,
        crossAxisSpacing: 65,
        mainAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://picsum.photos/seed/\${key}_$index/200/300',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Tom Holland",
              style: AppTextStyle.medium12(context),
            ),
          ],
        );
      },
    );
  }
}
