import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/core/services/api/api_service.dart';
import 'package:movies_app/core/services/shared_preferences/shared_preferences_service.dart';

class WatchListMoviesSource {
  final ApiService _apiService;

  WatchListMoviesSource(this._apiService);
  Future<List<MovieDetailsModel>> getWatchListMovies() async {
    List moviesWatchListIds = await SharedPreferencesService.getList(
      key: kWatchListKey,
    );
    if (moviesWatchListIds.isEmpty) {
      return [];
    }
    List<MovieDetailsModel> movies = [];
    for (var movieId in moviesWatchListIds) {
      movies.add(
        await _apiService.getMovieDetails(movieId: int.parse(movieId)),
      );
    }
    return movies;
  }
}
