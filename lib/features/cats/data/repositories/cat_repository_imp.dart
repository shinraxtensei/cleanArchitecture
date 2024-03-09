import 'package:clean_architecture/common/error/exception.dart';
import 'package:clean_architecture/common/error/failure.dart';
import 'package:clean_architecture/features/cats/data/datasources/get_remote_cats.dart';
import 'package:clean_architecture/features/cats/domain/entities/cat_entity.dart';
import 'package:clean_architecture/features/cats/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImp implements CatRepository {
  final GetRemoteCatsDataSource catDataSource;
  CatRepositoryImp(this.catDataSource);

  @override
  Future<Either<Failure, List<Cat>>> getCat() async {
    try {
      final remoteCats = await catDataSource.getRemoteCats();
      return Right(remoteCats);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
