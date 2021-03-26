part of 'regions_bloc.dart';

abstract class RegionsEvent extends Equatable {
  const RegionsEvent();

  @override
  List<Object> get props => [];
}

class RegionsGetEvent extends RegionsEvent {}
