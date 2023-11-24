import 'package:dartz/dartz.dart';
import 'package:movie/features/home/data/model/popular_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PopularModel>>> featchPopularMovie();
}
