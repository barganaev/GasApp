import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gasapp/models/list_of_stations_model.dart';
import 'package:gasapp/repo/requests.dart';

part 'list_of_stations_event.dart';
part 'list_of_stations_state.dart';

class ListOfStationsBloc
    extends Bloc<ListOfStationsEvent, ListOfStationsState> {
  ListOfStationsBloc() : super(ListOfStationsInitialState());

  @override
  Stream<ListOfStationsState> mapEventToState(
      ListOfStationsEvent event) async* {
    if (event is ListOfStationsGetEvent) {
      yield ListOfStationsLoadingState();
      try {
        print("HERE I AM222");
        List<ListOfStationsModel> listOfStationsModel = await ApiProvider()
            .requestPost("listOfStations", regionId: event.regionId);
        print(listOfStationsModel);
        if (listOfStationsModel != null) {
          print("HELLO! NOT NULL222");
          yield ListOfStationsLoadedState(
              listOfStationsModel: listOfStationsModel);
        } else {
          print("HELLO! ISISIS NULL222");
          yield ListOfStationsErrorState();
        }
      } catch (e) {
        yield ListOfStationsErrorState();
      }
    }
  }
}
