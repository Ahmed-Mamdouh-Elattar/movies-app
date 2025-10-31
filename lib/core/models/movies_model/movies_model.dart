import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/core/models/movies_model/movie_results.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity.dart';
import 'package:movies_app/features/show_movies/domain/entities/movies_entity.dart';

class MoviesModel {
  int page;
  List<MoviesResults> results;
  int totalPages;
  int totalResults;

  MoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    page: json["page"],
    results: List<MoviesResults>.from(
      json["results"].map((x) => MoviesResults.fromJson(x)),
    ),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };

  List<MoviesEntity> toMoviesEntity() => results
      .map(
        (e) => MoviesEntity(
          id: e.id ?? 0,
          poster: e.posterPath == null ? "" : "$kBaseImageURL${e.posterPath}",
        ),
      )
      .toList();
  List<SearchMoviesEntity> toSearchMoviesEntity() => results
      .map(
        (e) => SearchMoviesEntity(
          id: e.id ?? 0,
          poster: e.posterPath == null ? "" : "$kBaseImageURL${e.posterPath}",
          title: e.title,
          releaseDate: e.releaseDate.toString(),
          rating: e.voteAverage,
        ),
      )
      .toList();
}
