import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class MovieDetailRow extends StatelessWidget {
  const MovieDetailRow({
    required this.icon,
    required this.text,
    super.key,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyle.regular12(context)),
      ],
    );
  }
}
