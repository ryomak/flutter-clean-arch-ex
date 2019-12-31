import 'package:dartz/dartz.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';

abstract class GetUsers {
  Output get(Input input);
}

class Input  {
  int id;
  Input([int id]){
    this.id = id ;
  }
}

class Output {
  Future<Either<Failure, User>> user;

  Output({this.user});
}