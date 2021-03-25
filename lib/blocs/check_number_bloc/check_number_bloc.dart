import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gasapp/models/check_login_model.dart';
import 'package:gasapp/repo/requests.dart';

part 'check_number_event.dart';
part 'check_number_state.dart';

class CheckNumberBloc extends Bloc<CheckNumberEvent, CheckNumberState> {
  CheckNumberBloc() : super(CheckNumberInitialState());

  @override
  Stream<CheckNumberState> mapEventToState(CheckNumberEvent event) async* {
    if (event is CheckPhoneNumberEvent) {
      yield CheckNumberLoadingState();
      // await Future.delayed(Duration(seconds: 300));
      try {
        CheckModule checkModule = await ApiProvider()
            .requestPost("check", phoneNumber: event.phoneNumber);
        print("checkModule.message");
        print(checkModule.message);
        if (checkModule.status == 1) {
          print("Everything is ok");
          yield CheckNumberLoadedState(phoneNumber: event.phoneNumber);
        } else {
          print("Everything not is bad");
          yield CheckNumberErrorState();
        }
      } catch (e) {
        print("Everything bad");
        yield CheckNumberErrorState();
      }
    }
  }
}
