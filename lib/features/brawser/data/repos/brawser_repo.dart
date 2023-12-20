import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/brawser/data/models/categoryname/genre.dart';

abstract class BrawserRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategoryName();
}
