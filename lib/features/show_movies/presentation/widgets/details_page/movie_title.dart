import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class MoviesTitle extends StatelessWidget {
  const MoviesTitle({required this.movieTitle, super.key});
  final String movieTitle;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: 40 + ((95 / width) * width),
        ), // to fit with the width of photo to not render over it
        Expanded(
          child: Text(movieTitle, style: AppTextStyle.semiBold18(context)),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
