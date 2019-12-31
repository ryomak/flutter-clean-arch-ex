import 'dart:convert';
import 'package:flutter_app_1/src/core/error/Exception.dart';
import 'package:meta/meta.dart';

import 'package:flutter_app_1/src/data/datasource/LocalCacheUser.dart';
import 'package:flutter_app_1/src/data/resource/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_ME_DATA = "me_data";

class LocalCacheUserImpl implements LocalCacheUser {

  final SharedPreferences sharedPreferences;

  LocalCacheUserImpl({@required this.sharedPreferences});


  @override
  Future<UserModel> getMe(){
    final jsonString = sharedPreferences.getString(CACHED_ME_DATA);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> setMe(UserModel model){
    return sharedPreferences.setString(
      CACHED_ME_DATA,
      json.encode(model.toJson()),
    );
  }
}