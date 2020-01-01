import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_1/src/presentation/bloc/Bloc.dart';
import 'package:flutter_app_1/src/core/error/Failure.dart';

class UserSearchInputForm extends StatefulWidget {

  @override
  State<UserSearchInputForm> createState() => _SearchInputFormState();
}

class _SearchInputFormState extends State<UserSearchInputForm> {
  final _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onSearchButtonPressed() {
      BlocProvider.of<UserBloc>(context).add(
        GetUserById(
          id: int.parse(_userIdController.text),
        ),
      );
      _userIdController.clear();
    }

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is Error) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print(state);
          return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'id'),
                  controller: _userIdController,
                  keyboardType: TextInputType.number,
                ),
                RaisedButton(
                  onPressed:
                  state is! UserLoading ? _onSearchButtonPressed : null,
                  child: Text('SEARCH'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}