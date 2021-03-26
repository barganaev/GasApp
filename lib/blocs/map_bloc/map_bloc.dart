import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapLoadingState());

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is MapGetMarkersEvent) {
      await Future.delayed(Duration(seconds: 1));
      yield MapLoadedState();
    }
  }
}
