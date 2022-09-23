part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel user;
  LoginSuccess(this.user);
}

class LoginError extends LoginState {}

class ChangePasswordVisibilityState extends LoginState{}

