import 'package:flutter/material.dart';
import 'package:movies_app/core/config/app_color.dart';
import 'package:movies_app/core/config/app_text_style.dart';
import 'package:movies_app/core/helper/constants.dart';

class MoviesTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MoviesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.only(left: kPadding),
      labelStyle: AppTextStyle.medium14(context),
      tabAlignment: TabAlignment.start,
      unselectedLabelStyle: AppTextStyle.regular14(context),
      indicatorColor: AppColor.blue,
      isScrollable: true,
      labelColor: AppColor.blue,
      unselectedLabelColor: Colors.white,
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.only(right: 12),

      tabs: const [
        Tab(text: "Now Playing"),
        Tab(text: "Upcoming"),
        Tab(text: "Top Rated"),
        Tab(text: "Popular"),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
