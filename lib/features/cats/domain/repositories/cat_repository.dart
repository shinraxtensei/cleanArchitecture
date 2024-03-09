import 'package:clean_architecture/common/error/failure.dart';
import 'package:clean_architecture/features/cats/domain/entities/cat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getCat();
}
