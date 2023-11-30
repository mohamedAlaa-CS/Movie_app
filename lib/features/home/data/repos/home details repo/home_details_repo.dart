import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';

abstract class HomeDetailsRepo {
  Future<Either<Failure, DetailsModel>> featchDetails({required int id});
}
