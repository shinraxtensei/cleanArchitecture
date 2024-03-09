import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/use_case.dart';
import 'package:clean_architecture/features/cats/domain/entities/cat_entity.dart';
import 'package:clean_architecture/features/cats/domain/usecases/get_cats.dart';
import 'package:equatable/equatable.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final GetCatsUseCase getCats;
  CatsBloc(
    this.getCats,
  ) : super(CatsInitial()) {
    on<GetCats>(_fetchCats);
  }

  Future<void> _fetchCats(GetCats event, Emitter<CatsState> emit) async {
    emit(CatsLoading());
    try {
      final cats = await getCats(NoParams());
      cats.fold(
        (failure) => emit(CatsFailure(failure.toString())),
        (cats) => emit(CatsSuccess(cats)),
      );
    } catch (error) {
      emit(CatsFailure(error.toString()));
    }
  }
}
