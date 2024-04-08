import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';
import 'package:movie/models/movie_model.dart';

abstract class HomeDetailsRepo {
  Future<Either<Failure, DetailsModel>> featchDetails({required int id});
  Future<Either<Failure, List<MovieModel>>> featchSimilarMovie(
      {required int id});
}
