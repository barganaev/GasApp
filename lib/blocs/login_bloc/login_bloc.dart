import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthLoginEvent) {
      yield LoginLoading();
      try {
        Future.delayed(Duration(seconds: 2));
        LoginModel loginModel = LoginModel(token: "1", code: 0);
        if (loginModel.code == 0) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", loginModel.token);
          yield LoginLoaded(loginModel: loginModel);
        } else {
          yield LoginErrorState();
        }
      } catch (e) {
        yield LoginErrorState();
      }
    }
  }
}
