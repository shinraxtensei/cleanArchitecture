part of 'cats_bloc.dart';

abstract class CatsState extends Equatable {
  const CatsState();

  @override
  List<Object> get props => [];
}

class CatsInitial extends CatsState {}

class CatsLoading extends CatsState {}

class CatsSuccess extends CatsState {
  final List<Cat> cats;

  const CatsSuccess(this.cats);

  @override
  List<Object> get props => [cats];
}

class CatsFailure extends CatsState {
  final String error;

  const CatsFailure(this.error);

  @override
  List<Object> get props => [error];
}
