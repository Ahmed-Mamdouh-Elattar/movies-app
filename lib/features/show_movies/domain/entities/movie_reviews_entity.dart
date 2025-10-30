class MovieReviewsEntity {
  final String author;
  final String content;
  final String avatar;
  final double? rating;

  MovieReviewsEntity({
    required this.rating,
    required this.author,
    required this.avatar,
    required this.content,
  });
}
