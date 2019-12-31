
import 'package:flutter_app_1/src/data/resource/UserModel.dart';

abstract class UserClient {
  Future<UserModel> getUserById(int id);
  Future<List<UserModel>> getUsers();
}