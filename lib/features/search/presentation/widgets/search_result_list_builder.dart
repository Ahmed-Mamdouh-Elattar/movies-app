import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/widgets/search_result_list.dart';

class SearchResultListBuilder extends StatelessWidget {
  const SearchResultListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(orElse: () => true, loadingMore: () => false);
      },
      builder: (context, state) {
        return state.whenOrNull(
              initial: () => const Center(child: Text("No movies found")),
              loaded: (movies) {
                if (movies.isEmpty) {
                  return const Center(child: Text("No movies"));
                }
                return SearchResultList(movies: movies);
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              failure: (errMessage) => Center(child: Text(errMessage)),
            ) ??
            const Center(child: Text("No movies"));
      },
    );
  }
}
