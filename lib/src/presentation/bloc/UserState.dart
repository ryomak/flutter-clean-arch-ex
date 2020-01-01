import 'package:flutter_app_1/src/domain/entity/User.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable  {
  @override
  List<Object> get props => [];
}

class Empty extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded({@required this.user});
}

class Error extends UserState {
  final String message;

  Error({@required this.message});
}