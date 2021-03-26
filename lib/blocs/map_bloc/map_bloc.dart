import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:gasapp/repo/requests.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapLoadingState());

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is MapGetMarkersEvent) {
      try {
        // final result = await Future.wait(
        //   [
        //     ApiProvider().requestPost("regions"),
        //     ApiProvider().requestPost("stations"),
        //   ],
        // );
        print("HERE I AM");
        List<StationsModel> stationsModel =
            await ApiProvider().requestPost("stations");
        print(stationsModel);
        if (stationsModel != null) {
          print("HELLO! NOT NULL");
          yield MapLoadedState(stationsModel: stationsModel);
        } else {
          print("HELLO! ISISIS NULL");
          yield MapErrorState();
        }
      } catch (e) {
        yield MapErrorState();
      }
    }
  }
}
