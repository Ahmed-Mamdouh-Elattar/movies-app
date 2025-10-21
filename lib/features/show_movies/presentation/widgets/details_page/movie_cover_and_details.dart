
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class MovieCoverAndDetails extends StatelessWidget {
  const MovieCoverAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: width,
              child: AspectRatio(
                aspectRatio: 1.8,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: 'https://picsum.photos/seed/\${key}_1/200/300',
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              bottom: -60,
              child: SizedBox(
                width: (95 / width) * width,
                child: AspectRatio(
                  aspectRatio: 0.79,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/seed/\${key}_2/200/300',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 9,
              right: 11,
              child: ClipPath(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withAlpha(150),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: AppColor.goldOrange,
                          size: 24,
                        ),
                        const SizedBox(width: 0.5),
                        Text(
                          "9.5",
                          style: AppTextStyle.semiBold12(
                            context,
                          ).copyWith(color: AppColor.goldOrange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30 + ((95 / width) * width),
            ), // to fit with the width of photo to not render over it
            Expanded(
              child: Text(
                "Spiderman No Way Home",
                style: AppTextStyle.semiBold18(context),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month),
            SizedBox(width: 4),
            Text("2021"),
            SizedBox(width: 12),
            Text("|"),
            SizedBox(width: 12),
            Icon(Icons.timer_outlined),
            SizedBox(width: 4),
            Text("148 Minutes"),
            SizedBox(width: 12),
            Text("|"),
            SizedBox(width: 12),
            Icon(Icons.payment),
            SizedBox(width: 4),
            Text("Action"),
          ],
        ),
      ],
    );
  }
}
