
import 'package:flutter_app_1/src/data/datasource/LocalCacheUser.dart';
import 'package:flutter_app_1/src/data/client/UserClient.dart';
import 'package:flutter_app_1/src/core/network/NetWorkInfo.dart';
import 'package:flutter_app_1/src/domain/repository/UserRepository.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';
import 'package:flutter_app_1/src/core/error/Exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';
import 'package:meta/meta.dart';

class UserRepositoryImpl implements UserRepository{
  final LocalCacheUser localCacheUser;
  final UserClient userClient;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    @required this.localCacheUser,
    @required this.userClient,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> findOneByID(int id)async{
    return _getUser(userClient.getUserById(id));
  }

  Future<Either<Failure, User>> _getUser(Future<User> result) async{
    if (await networkInfo.isConnected){
      try{
        final user = await result;
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }

}