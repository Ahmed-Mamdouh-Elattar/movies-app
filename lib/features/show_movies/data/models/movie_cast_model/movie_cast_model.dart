import 'package:movies_app/features/show_movies/data/models/movie_cast_model/cast.dart';

class MovieCastModel {
  final int? id;
  final List<Cast>? cast;
  final List<Cast>? crew;

  MovieCastModel({this.id, this.cast, this.crew});

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
    id: json["id"],
    cast: json["cast"] == null
        ? []
        : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
    crew: json["crew"] == null
        ? []
        : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": cast == null
        ? []
        : List<dynamic>.from(cast!.map((x) => x.toJson())),
    "crew": crew == null
        ? []
        : List<dynamic>.from(crew!.map((x) => x.toJson())),
  };
}
