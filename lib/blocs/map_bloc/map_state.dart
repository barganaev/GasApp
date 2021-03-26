part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapLoadingState extends MapState {}

class MapLoadedState extends MapState {
  final List<StationsModel> stationsModel;
  MapLoadedState({@required this.stationsModel});
}

class MapErrorState extends MapState {}
