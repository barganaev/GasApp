part of 'self_station_bloc.dart';

abstract class SelfStationEvent extends Equatable {
  const SelfStationEvent();

  @override
  List<Object> get props => [];
}

class SelfStationGetEvent extends SelfStationEvent {
  final String token, regionId;
  SelfStationGetEvent({this.token, this.regionId});
}

class SelfStationToggleEvent extends SelfStationEvent {
  final String token, regionId, isOpen, stationId;
  SelfStationToggleEvent({
    this.token,
    this.regionId,
    this.isOpen,
    this.stationId,
  });
}
