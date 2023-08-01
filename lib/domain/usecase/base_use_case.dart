import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, P> {
  Future<T> call(P param);
}

class DefaultParams extends Equatable {
  const DefaultParams();
  @override
  List<Object> get props => [];
}