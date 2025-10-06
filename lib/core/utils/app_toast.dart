import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';

void showAppToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColor.goldOrange,
      content: Text(
        message,
        style: AppTextStyle.regular14(
          context,
        ).copyWith(color: AppColor.lightenWhite),
      ),
    ),
  );
}
