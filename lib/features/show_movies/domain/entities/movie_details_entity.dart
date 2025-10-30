class MovieDetailsEntity {
  final int id;

  final String poster;
  final String backDrop;
  final String title;
  final double voting;
  final String duration;
  final String date;
  final String overview;
  final List<String> genres;

  MovieDetailsEntity({
    required this.id,
    required this.poster,
    required this.backDrop,
    required this.title,
    required this.voting,
    required this.duration,
    required this.date,
    required this.overview,
    required this.genres,
  });
}
