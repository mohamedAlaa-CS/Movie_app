import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieModel>>> featchSearch(
      {required String query});
}
