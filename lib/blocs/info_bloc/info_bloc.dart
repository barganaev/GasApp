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
      try {
        List<InfoModel> list = await ApiProvider().requestPost("information");
        if (list != null) {
          yield InfoLoaded(infoModel: list[0]);
        } else {
          yield InfoError();
        }
      } catch (e) {
        yield InfoError();
      }
    }
  }
}
