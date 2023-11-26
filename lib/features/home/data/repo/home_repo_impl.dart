import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home/data/model/popular_model.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PopularModel>>> featchPopularMovie() async {
    try {
      var data = await apiService.get(
          endPoint: 'popular?api_key=8b104227bc3518198c861fdf19a3b565');
      List<PopularModel> popular = [];
      for (var item in data['results']) {
        popular.add(PopularModel.fromJson(item));
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
  Future<Either<Failure, List<RecomendModel>>> feactchRecomendMovie() async {
    try {
      var data = await apiService.get(
          endPoint: 'top_rated?api_key=8b104227bc3518198c861fdf19a3b565');

      List<RecomendModel> recomendList = [];
      for (var item in data['results']) {
        recomendList.add(RecomendModel.fromJson(item));
      }
      return right(recomendList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
