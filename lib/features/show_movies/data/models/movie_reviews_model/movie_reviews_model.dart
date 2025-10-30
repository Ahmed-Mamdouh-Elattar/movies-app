import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/result.dart';
import 'package:movies_app/features/show_movies/domain/entities/movie_reviews_entity.dart';

class MovieReviewsModel {
  final int? id;
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  MovieReviewsModel({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieReviewsModel.fromJson(Map<String, dynamic> json) =>
      MovieReviewsModel(
        id: json["id"],
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x)),
              ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
  List<MovieReviewsEntity> toEntity() {
    return results!
        .map(
          (e) => MovieReviewsEntity(
            rating: e.authorDetails!.rating,
            author: e.author!,
            avatar: e.authorDetails?.avatarPath != null
                ? "$kBaseImageURL${e.authorDetails?.avatarPath}"
                : kFakeImage,

            content: e.content!,
          ),
        )
        .toList();
  }
}
