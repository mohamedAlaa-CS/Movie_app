import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/brawser/data/models/categoryname/genre.dart';
import 'package:movie/features/brawser/data/repos/brawser_repo.dart';

class BrawserRepoImpel implements BrawserRepo {
  final ApiService apiService;

  BrawserRepoImpel({required this.apiService});
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryName() async {
    try {
      var data = await apiService.get(
          endPoint:
              'genre/movie/list?api_key=8b104227bc3518198c861fdf19a3b565');
      List<CategoryModel> categorydata = [];
      for (var item in data['genres']) {
        categorydata.add(CategoryModel.fromJson(item));
      }
      return right(categorydata);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
