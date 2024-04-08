import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/search/data/repos/search_repo.dart';
import 'package:movie/models/movie_model.dart';

class SearchRepoImple implements SearchRepo {
  final ApiService apiService;

  SearchRepoImple(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> featchSearch(
      {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'search/movie?api_key=8b104227bc3518198c861fdf19a3b565&query=$query');
      List<MovieModel> searchMovieList = [];
      for (var item in data['results']) {
        searchMovieList.add(MovieModel.fromJson(item));
      }
      return right(searchMovieList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
