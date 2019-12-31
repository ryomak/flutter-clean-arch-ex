import 'package:dartz/dartz.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> findOneByID(int id);
}