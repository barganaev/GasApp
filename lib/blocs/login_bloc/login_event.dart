part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends LoginEvent {
  final String login;
  final String password;
  AuthLoginEvent({@required this.login, @required this.password});
}

class AuthLogoutEvent extends LoginEvent {}
