class MovieDetailsEntity {
  String poster;
  String backDrop;
  String title;
  double voting;
  String duration;
  String date;
  String overview;
  List<String> genres;

  MovieDetailsEntity({
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
