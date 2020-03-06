import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failures.dart';
import 'package:number_trivia/features/connection/domain/entities/server.dart';

abstract class ServerRepository {
  Future<Either<Failure, Server>> getServer(String name);
  Future<Either<Failure, Server>> saveServer(Server server);
}
