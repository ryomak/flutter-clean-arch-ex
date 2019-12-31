import 'package:flutter_app_1/src/data/resource/UserModel.dart';

abstract class LocalCacheUser {
  Future<UserModel> getMe();
  Future<void> setMe(UserModel model);
}