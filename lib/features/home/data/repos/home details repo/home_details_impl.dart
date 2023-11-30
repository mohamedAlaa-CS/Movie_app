import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo.dart';

class HomeDetailsRepoImpl implements HomeDetailsRepo {
  final ApiService apiService;

  HomeDetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, DetailsModel>> featchDetails(
      {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint: '$query?api_key=8b104227bc3518198c861fdf19a3b565');

      return right(DetailsModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
