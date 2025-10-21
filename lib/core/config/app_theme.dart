import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        titleTextStyle: AppTextStyle.semiBold16(context),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
