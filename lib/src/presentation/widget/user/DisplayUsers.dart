import 'package:flutter/material.dart';
import 'package:flutter_app_1/src/domain/entity/User.dart';

class DisplayUsers extends StatelessWidget {
  final User user;

  const DisplayUsers({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            user.name+"/"+user.gender,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}