part of 'self_station_bloc.dart';

abstract class SelfStationState extends Equatable {
  const SelfStationState();

  @override
  List<Object> get props => [];
}

class SelfStationInitial extends SelfStationState {}

class SelfStationLoaded extends SelfStationState {
  SelfStationModel selfStationModel;
  SelfStationLoaded({this.selfStationModel});
}

class SelfStationLoading extends SelfStationState {}

class SelfStationError extends SelfStationState {}
