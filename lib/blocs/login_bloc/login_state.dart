part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModel loginModel;
  LoginLoaded({@required this.loginModel}) : assert(loginModel != null);
}

class LoginErrorState extends LoginState {}
