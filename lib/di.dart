import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_1/src/domain/repository/UserRepository.dart';
import 'package:flutter_app_1/src/data/repository/impl/UserRepositoryImpl.dart';
import 'package:flutter_app_1/src/data/client/UserClient.dart';
import 'package:flutter_app_1/src/data/client/impl/UserClientImpl.dart';
import 'package:flutter_app_1/src/data/datasource/LocalCacheUser.dart';
import 'package:flutter_app_1/src/data/datasource/impl/LocalCacheUserImpl.dart';
import 'package:flutter_app_1/src/core/network/NetWorkInfo.dart';
import 'package:flutter_app_1/src/usecase/GetUsers.dart';
import 'package:flutter_app_1/src/usecase/impl/GetUsersImpl.dart';
import 'package:flutter_app_1/src/presentation/bloc/UserBloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Bloc
  sl.registerFactory(
        () => UserBloc(
      getUsers: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetUsers>(
      ()=> GetUsersImpl(userRepository:sl()),
  );


    // Repository
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      localCacheUser: sl(),
      userClient: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserClient>(
        () => UserClientImpl(client: sl()),
  );

  sl.registerLazySingleton<LocalCacheUser>(
        () => LocalCacheUserImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}