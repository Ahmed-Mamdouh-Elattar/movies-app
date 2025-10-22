import 'package:dio/dio.dart';
import 'package:movies_app/features/show_movies/data/models/movies_model/movies_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("movie/{category}")
  Future<MoviesModel> getMoviesByCategory({
    @Path("category") required String category,
    @Query("page") required int page,
    @Query("language") String language = "en-US",
  });
}
