part of 'check_number_bloc.dart';

abstract class CheckNumberEvent extends Equatable {
  const CheckNumberEvent();

  @override
  List<Object> get props => [];
}

class CheckPhoneNumberEvent extends CheckNumberEvent {
  final String phoneNumber;

  CheckPhoneNumberEvent({@required this.phoneNumber});
}
