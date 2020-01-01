import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app_1/src/presentation/bloc/UserEvent.dart';
import 'package:flutter_app_1/src/presentation/bloc/UserState.dart';
import 'package:flutter_app_1/src/usecase/GetUsers.dart';
import 'package:flutter_app_1/src/core/util/InputConverter.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc({
    @required GetUsers getUsers,
  })  : assert(getUsers != null),
        this.getUsers = getUsers;

  @override
  UserState get initialState => Empty();

  @override
  Stream<UserState> mapEventToState(
      UserEvent event,
  ) async* {
    if (event is GetUserById){
      yield UserLoading();
      final output = await getUsers.get(new Input(event.id));
      yield output.result.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (user) => UserLoaded(user: user),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}