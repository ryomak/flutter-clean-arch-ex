
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_1/src/presentation/bloc/Bloc.dart';
import 'package:flutter_app_1/di.dart';
import 'package:flutter_app_1/src/presentation/widget/common/Common.dart';
import 'package:flutter_app_1/src/presentation/widget/user/DisplayUsers.dart';
import 'package:flutter_app_1/src/presentation/widget/user/UserSerachInputForm.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserPage'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<UserBloc> buildBody(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => sl<UserBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              BlocBuilder<UserBloc, UserState>(
                builder: (BuildContext context, UserState state) {
                  if (state is Empty) {
                    return LoadingWidget();
                  } else if (state is UserLoading) {
                    return LoadingWidget();
                  } else if (state is UserLoaded) {
                    return DisplayUsers(user:state.user);
                  }else if (state is Error) {
                    return LoadingWidget();
                  }
                  return LoadingWidget();
                },
              ),
              SizedBox(height: 20),
              UserSearchInputForm()
            ],
          ),
        ),
      ),
    );
  }
}