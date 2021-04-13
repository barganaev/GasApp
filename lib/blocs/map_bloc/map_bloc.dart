import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gasapp/models/stations_model.dart';
import 'package:gasapp/repo/requests.dart';
import 'package:gasapp/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        yield MapLoadingState();
        print("HERE I AM");
        List<StationsModel> stationsModel =
            await ApiProvider().requestPost("stations");
        print(stationsModel);
        if (stationsModel != null) {
          print("HELLO! NOT NULL");
          List<BitmapDescriptor> listOfIcons = await iconSet();
          yield MapLoadedState(
              stationsModel: stationsModel, listOfIcons: listOfIcons);
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
