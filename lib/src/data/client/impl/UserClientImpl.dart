import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/data/resource/UserModel.dart';
import 'package:flutter_app_1/src/data/client/UserClient.dart';
import 'package:flutter_app_1/src/core/error/Exception.dart';
import 'dart:convert';

const USER_CLIENT_URL = "http://localhost:8080/user";

class UserClientImpl implements UserClient {

  final http.Client client;

  UserClientImpl({@required this.client});

  @override
  Future<UserModel> getUserById(int id){
    return _getRequest(USER_CLIENT_URL+"/"+id.toString());
  }

  @override
  Future<List<UserModel>> getUsers(){
    return _getRequest(USER_CLIENT_URL);
  }

  _getRequest(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

}