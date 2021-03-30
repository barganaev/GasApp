part of 'list_of_stations_bloc.dart';

abstract class ListOfStationsState extends Equatable {
  const ListOfStationsState();

  @override
  List<Object> get props => [];
}

class ListOfStationsInitialState extends ListOfStationsState {}

class ListOfStationsLoadingState extends ListOfStationsState {}

class ListOfStationsLoadedState extends ListOfStationsState {
  final List<ListOfStationsModel> listOfStationsModel;

  ListOfStationsLoadedState({@required this.listOfStationsModel});
}

class ListOfStationsErrorState extends ListOfStationsState {}
