class MovieWatchListEntity {
  final int id;
  final String poster;

  final String title;
  final double voting;
  final String duration;
  final String date;

  final List<String> genres;

  MovieWatchListEntity({
    required this.id,
    required this.poster,

    required this.title,
    required this.voting,
    required this.duration,
    required this.date,
    required this.genres,
  });
}
