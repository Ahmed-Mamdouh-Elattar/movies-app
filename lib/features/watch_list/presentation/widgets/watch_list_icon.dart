import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/watch_list/presentation/managers/cubit/watch_list_cubit.dart';

class WatchListIcon extends StatelessWidget {
  const WatchListIcon({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<WatchListCubit>()..isMovieExistedInWatchList(id.toString()),
      child: IconButton(
        onPressed: () {
          context.read<WatchListCubit>().addOrDeleteMovieToWatchList(
            id.toString(),
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
      ),
    );
  }
}
