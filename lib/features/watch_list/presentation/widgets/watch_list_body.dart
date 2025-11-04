import 'package:flutter/material.dart';

import 'package:movies_app/features/watch_list/presentation/widgets/watch_list_body_builder.dart';

class WatchListBody extends StatelessWidget {
  const WatchListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(title: Text('Watchlist'), centerTitle: true, pinned: true),
        WatchListBodyBuilder(),
      ],
    );
  }
}
