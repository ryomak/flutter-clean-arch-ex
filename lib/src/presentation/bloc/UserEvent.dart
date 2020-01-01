import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserById extends UserEvent {
  final int id;

  GetUserById({@required this.id});

  @override
  List<Object> get props => [id];
}
