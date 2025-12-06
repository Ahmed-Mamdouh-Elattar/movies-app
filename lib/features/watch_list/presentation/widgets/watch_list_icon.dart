import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_notifier/watch_list_notifier_cubit.dart';

class WatchListIcon extends StatelessWidget {
  const WatchListIcon({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<WatchListCubit>()..isMovieExistedInWatchList(id.toString()),
      child: IconButtonBuilder(id: id),
    );
  }
}

class IconButtonBuilder extends StatelessWidget {
  const IconButtonBuilder({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchListState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<WatchListCubit>().addOrDeleteMovieToWatchList(
              id.toString(),
            );
            context.read<WatchListNotifierCubit>().watchListChange();
          },
          icon: state.maybeWhen(
            orElse: () => const Icon(Icons.bookmark_border),
            addOrDeleteMovieSuccess: (isExisted) {
              return Icon(isExisted ? Icons.bookmark : Icons.bookmark_border);
            },
          ),
        );
      },
    );
  }
}
