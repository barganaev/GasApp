import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasapp/models/info_model.dart';
import 'package:gasapp/repo/requests.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial());

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    if (event is InfoGetEvent) {
      yield InfoLoading();
      print("STARTED INFO BLOC");
      try {
        List<InfoModel> list = await ApiProvider().requestPost("information");
        if (list != null && list.isNotEmpty) {
          print(list.first.text);
          yield InfoLoaded(infoModel: list[0]);
        } else {
          print("ERROR");
          yield InfoError();
        }
      } catch (e) {
        print("ERRORvERROR");
        print(e);
        yield InfoError();
      }
    }
  }
}
