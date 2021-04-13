part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapLoadingState extends MapState {}

class MapLoadedState extends MapState {
  final List<StationsModel> stationsModel;
  List<BitmapDescriptor> listOfIcons;
  MapLoadedState({@required this.stationsModel, this.listOfIcons});
}

class MapErrorState extends MapState {}
