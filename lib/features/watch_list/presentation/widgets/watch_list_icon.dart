import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/managers/cubit/watch_list_cubit.dart';

class WatchListIcon extends StatefulWidget {
  const WatchListIcon({required this.id, super.key});
  final int id;

  @override
  State<WatchListIcon> createState() => _WatchListIconState();
}

class _WatchListIconState extends State<WatchListIcon> {
  @override
  void initState() {
    context.read<WatchListCubit>().isMovieExistedInWatchList(
      widget.id.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<WatchListCubit>().addOrDeleteMovieToWatchList(
          widget.id.toString(),
        );
      },
      icon: BlocBuilder<WatchListCubit, WatchListState>(
        buildWhen: (previous, current) {
          if (current is AddOrDeleteMovieSuccess) {
            return true;
          }
          return false;
        },

        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Icon(Icons.bookmark_border),
            addOrDeleteMovieSuccess: (isExisted) {
              return Icon(isExisted ? Icons.bookmark : Icons.bookmark_border);
            },
          );
        },
      ),
    );
  }
}
