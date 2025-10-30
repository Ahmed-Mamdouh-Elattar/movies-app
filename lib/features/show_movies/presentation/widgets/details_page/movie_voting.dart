import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class MovieVoting extends StatelessWidget {
  const MovieVoting({required this.voting, super.key});
  final String voting;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 9,
      right: 11,
      child: ClipPath(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  voting,
                  style: AppTextStyle.semiBold12(
                    context,
                  ).copyWith(color: AppColor.goldOrange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
