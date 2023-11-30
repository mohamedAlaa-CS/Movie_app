import 'package:dartz/dartz.dart';
import 'package:movie/features/home/data/model/new.model.dart';
import 'package:movie/features/home/data/model/popular_model.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';

import '../../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PopularModel>>> featchPopularMovie();
  Future<Either<Failure, List<RecomendModel>>> feactchRecomendMovie();
  Future<Either<Failure, List<NewModel>>> featchNewRelase();
}
