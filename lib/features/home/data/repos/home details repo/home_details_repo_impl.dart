import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo.dart';
import 'package:movie/models/movie_model.dart';

class HomeDetailsRepoImpl implements HomeDetailsRepo {
  final ApiService apiService;

  HomeDetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, DetailsModel>> featchDetails({required int id}) async {
    try {
      var data = await apiService.get(
          endPoint: 'movie/$id?api_key=8b104227bc3518198c861fdf19a3b565');

      return right(DetailsModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> featchSimilarMovie(
      {required int id}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'movie/$id/similar?api_key=8b104227bc3518198c861fdf19a3b565');
      List<MovieModel> similarList = [];
      for (var item in data['results']) {
        similarList.add(MovieModel.fromJson(item));
      }
      return right(similarList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
