import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasapp/models/self_station.dart';
import 'package:gasapp/repo/requests.dart';

part 'self_station_bloc_event.dart';
part 'self_station_bloc_state.dart';

class SelfStationBloc extends Bloc<SelfStationEvent, SelfStationState> {
  SelfStationBloc() : super(SelfStationLoading());

  @override
  Stream<SelfStationState> mapEventToState(SelfStationEvent event) async* {
    if (event is SelfStationGetEvent) {
      yield SelfStationLoading();
      try {
        SelfStationModel selfStationModel = await ApiProvider().requestPost(
          "selfStation",
          token: event.token,
          regionId: "1",
        );
        print(selfStationModel.message[0].id);
        if (selfStationModel.message != null) {
          yield SelfStationLoaded(selfStationModel: selfStationModel);
        } else {
          yield SelfStationError();
        }
      } catch (e) {
        yield SelfStationError();
      }
    }
  }
}
