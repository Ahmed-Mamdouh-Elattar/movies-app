import 'package:dio/dio.dart';
import 'package:movies_app/core/models/movies_model/movies_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET('/search/movie')
  Future<MoviesModel> searchMovies({
    @Query('query') required String query,
    @Query('page') required int page,
    @CancelRequest() required CancelToken cancelToken,
    @Query("language") String language = "en-US",
  });
}
