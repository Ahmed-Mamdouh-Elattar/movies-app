import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/managers/watch_list_notifier/watch_list_notifier_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/watch_list_movie_item.dart';

class WatchListBodyBuilder extends StatefulWidget {
  const WatchListBodyBuilder({super.key});

  @override
  State<WatchListBodyBuilder> createState() => _WatchListBodyBuilderState();
}

class _WatchListBodyBuilderState extends State<WatchListBodyBuilder> {
  @override
  void initState() {
    context.read<WatchListCubit>().getWatchListMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchListNotifierCubit, bool>(
      listener: (context, state) {
        if (state) {
          context.read<WatchListCubit>().getWatchListMovies();
          context.read<WatchListNotifierCubit>().reset();
        }
      },
      child: BlocBuilder<WatchListCubit, WatchListState>(
        buildWhen: (previous, current) {
          if (current is AddOrDeleteMovieSuccess) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          return state.whenOrNull(
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                success: (movies) {
                  if (movies.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: Text("There is no movies")),
                    );
                  }
                  return SliverList.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context
                            .push(PageName.details, extra: movies[index].id)
                            .then((value) async {
                              if (value == true) {
                                if (context.mounted) {
                                  await context
                                      .read<WatchListCubit>()
                                      .getWatchListMovies();
                                }
                              }
                            });
                      },
                      child: WatchListMovieItem(movie: movies[index]),
                    ),
                  );
                },
                failure: (errMessage) =>
                    SliverFillRemaining(child: Center(child: Text(errMessage))),
              ) ??
              const SliverToBoxAdapter();
        },
      ),
    );
  }
}
