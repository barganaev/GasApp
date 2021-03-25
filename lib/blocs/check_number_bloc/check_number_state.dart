part of 'check_number_bloc.dart';

abstract class CheckNumberState extends Equatable {
  const CheckNumberState();

  @override
  List<Object> get props => [];
}

class CheckNumberInitialState extends CheckNumberState {}

class CheckNumberLoadingState extends CheckNumberState {}

class CheckNumberLoadedState extends CheckNumberState {
  final String phoneNumber;

  CheckNumberLoadedState({@required this.phoneNumber});
}

class CheckNumberErrorState extends CheckNumberState {}
