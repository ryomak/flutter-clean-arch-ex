
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class User extends Equatable {
  int id;
  String name;
  String gender;

  User({
    @required this.id,
    @required this.name,
    @required this.gender
  });

  @override
  List<Object> get props => [id];

}