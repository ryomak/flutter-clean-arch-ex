import 'package:dartz/dartz.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';

abstract class GetUsers {
  Future<Output> get(Input input);
}

class Input  {
  int id;
  Input([int id]){
    this.id = id ;
  }
}

class Output {
  Either<Failure, User> result;

  Output([Either<Failure, User> result]){
    this.result = result;
  }
}