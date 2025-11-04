import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({required this.voting, super.key});

  final double voting;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_border,
          color: Colors.orange,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          voting.toString().substring(0, 3),
          style: AppTextStyle.semiBold12(context),
        ),
      ],
    );
  }
}
