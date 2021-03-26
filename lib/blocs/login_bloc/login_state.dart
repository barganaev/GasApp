part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final LoginModel loginModel;
  LoginLoadedState({@required this.loginModel}) : assert(loginModel != null);
}

class LoginErrorState extends LoginState {}
