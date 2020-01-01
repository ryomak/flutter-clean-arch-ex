import 'package:meta/meta.dart';
import 'package:flutter_app_1/src/usecase/GetUsers.dart';
import 'package:flutter_app_1/src/domain/repository/UserRepository.dart';

class GetUsersImpl implements GetUsers{

  final UserRepository userRepository;

  GetUsersImpl({@required this.userRepository});

  @override
  Future<Output>get(Input input)async{
    final result = await userRepository.findOneByID(input.id);
    print(result);
    return Output(result);
  }
}