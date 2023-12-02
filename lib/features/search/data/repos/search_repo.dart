import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> featchSearch(
      {required String query});
}
