class SearchMoviesEntity {
  final int id;
  final String? poster;
  final String? title;
  final String? releaseDate;
  final double? rating;

  SearchMoviesEntity({
    required this.id,

    this.rating,

    this.poster,
    this.title,
    this.releaseDate,
  });
}
