enum MovieCategory {
  popular(value: "popular"),
  nowPlaying(value: "now_playing"),
  topRated(value: "top_rated"),
  upcoming(value: "upcoming");

  const MovieCategory({required this.value});

  final String value;
}
