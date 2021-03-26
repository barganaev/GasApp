import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/models/login_model.dart';
import 'package:gasapp/repo/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthLoginEvent) {
      yield LoginLoadingState();
      try {
        LoginModel loginModel = await ApiProvider().requestPost("login",
            phoneNumber: event.phoneNumber, password: event.password);
        if (loginModel.code == 0) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", loginModel.accessToken);
          yield LoginLoadedState(loginModel: loginModel);
        } else {
          yield LoginErrorState();
        }
      } catch (e) {
        yield LoginErrorState();
      }
    }
  }
}
