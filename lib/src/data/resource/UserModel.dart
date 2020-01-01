
import 'package:flutter_app_1/src/domain/entity/User.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel({
    @required int id,
    @required String name,
    @required String gender,
  }) : super(id:id,name:name,gender:gender);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toInt(),
      name: json['name'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}