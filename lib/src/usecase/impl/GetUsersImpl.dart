import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/usecase/GetUsers.dart';
import 'package:flutter_app_1/src/domain/repository/UserRepository.dart';

class GetUsersImpl implements GetUsers{

  final UserRepository userRepository;

  GetUsersImpl({@required this.userRepository});

  @override
  Output get(Input input){
    final output = Output(result: userRepository.findOneByID(input.id));
    return output;
  }
}