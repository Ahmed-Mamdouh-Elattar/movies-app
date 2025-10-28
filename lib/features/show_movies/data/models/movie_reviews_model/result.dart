import 'package:movies_app/features/show_movies/data/models/movie_reviews_model/author_details.dart';

class Result {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? url;

  Result({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    author: json["author"],
    authorDetails: json["author_details"] == null
        ? null
        : AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: json["created_at"],
    id: json["id"],
    updatedAt: json["updated_at"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails?.toJson(),
    "content": content,
    "created_at": createdAt,
    "id": id,
    "updated_at": updatedAt,
    "url": url,
  };
}
