part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends LoginEvent {
  final String phoneNumber;
  final String password;
  AuthLoginEvent({@required this.phoneNumber, @required this.password});
}

class AuthLogoutEvent extends LoginEvent {}
