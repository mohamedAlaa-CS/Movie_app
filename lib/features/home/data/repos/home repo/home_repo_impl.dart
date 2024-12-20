import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo.dart';
import 'package:movie/models/movie_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> featchPopularMovie() async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/popular?api_key=8b104227bc3518198c861fdf19a3b565');
      List<MovieModel> popular = [];
      for (var item in data['results']) {
        popular.add(MovieModel.fromJson(item));
      }

      return right(popular);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> feactchRecomendMovie() async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/top_rated?api_key=8b104227bc3518198c861fdf19a3b565');

      List<MovieModel> recomendList = [];
      for (var item in data['results']) {
        recomendList.add(MovieModel.fromJson(item));
      }
      return right(recomendList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> featchNewRelase() async {
    try {
      var data = await apiService.get(
          endPoint:
              'movie/now_playing?api_key=8b104227bc3518198c861fdf19a3b565');
      List<MovieModel> newRelase = [];
      for (var item in data['results']) {
        newRelase.add(MovieModel.fromJson(item));
      }
      return right(newRelase);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
