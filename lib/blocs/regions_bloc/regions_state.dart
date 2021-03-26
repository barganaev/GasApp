part of 'regions_bloc.dart';

abstract class RegionsState extends Equatable {
  const RegionsState();

  @override
  List<Object> get props => [];
}

class RegionsInitialState extends RegionsState {}

class RegionsLoadingState extends RegionsState {}

class RegionsLoadedState extends RegionsState {
  RegionsModel regionsModel;
  RegionsLoadedState({this.regionsModel});
}

class RegionsErrorState extends RegionsState {}
