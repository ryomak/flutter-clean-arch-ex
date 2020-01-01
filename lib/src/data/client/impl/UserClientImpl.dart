import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/data/resource/UserModel.dart';
import 'package:flutter_app_1/src/data/client/UserClient.dart';
import 'package:flutter_app_1/src/core/error/Exception.dart';
import 'dart:convert';
import 'dart:async';

const USER_CLIENT_URL = "http://localhost:8080/user";

class UserClientImpl implements UserClient {

  final http.Client client;

  UserClientImpl({@required this.client});

  @override
  Future<UserModel> getUserById(int id) async{
    return await _getRequest(USER_CLIENT_URL+"/"+id.toString());
  }

  @override
  Future<List<UserModel>> getUsers(){
    return _getRequest(USER_CLIENT_URL);
  }

  _getRequest(String url) async {
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e){
      print('Error: $e');
      throw ServerException();
    }
  }
}