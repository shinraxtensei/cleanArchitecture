import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecases/use_case.dart';
import 'package:clean_architecture/features/cats/domain/entities/cat_entity.dart';
import 'package:clean_architecture/features/cats/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatsUseCase implements UseCase<List<Cat>, NoParams> {
  final CatRepository repository;

  GetCatsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) async {
    return await repository.getCat();
  }
}
