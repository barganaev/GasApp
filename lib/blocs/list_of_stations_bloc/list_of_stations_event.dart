part of 'list_of_stations_bloc.dart';

abstract class ListOfStationsEvent extends Equatable {
  const ListOfStationsEvent();

  @override
  List<Object> get props => [];
}

class ListOfStationsGetEvent extends ListOfStationsEvent {
  String regionId;
  ListOfStationsGetEvent({this.regionId});
}
