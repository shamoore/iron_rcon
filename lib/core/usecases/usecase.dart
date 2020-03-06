import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Params>> call(Params params);
}

class NoParams extends Equatable {}
