import 'package:dartz/dartz.dart';
import 'package:movie/models/movie_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> featchPopularMovie();
  Future<Either<Failure, List<MovieModel>>> feactchRecomendMovie();
  Future<Either<Failure, List<MovieModel>>> featchNewRelase();
}
