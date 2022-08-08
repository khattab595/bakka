part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  final LoginModel loginModel;

  AuthLoginSuccessState(this.loginModel);
}

class AuthLoginErrorState extends AuthState {
  final String error;

  AuthLoginErrorState(this.error);
}

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {
  final LoginModel registerModel;

  AuthRegisterSuccessState(this.registerModel);
}

class AuthRegisterErrorState extends AuthState {
  final String error;

  AuthRegisterErrorState(this.error);
}

class AuthShowPasswordState extends AuthState {}

class AuthProfileLoadingState extends AuthState {}

class AuthProfileSuccessState extends AuthState {
  final LoginModel loginModel;

  AuthProfileSuccessState(this.loginModel);
}

class AuthProfileErrorState extends AuthState {
  final String error;

  AuthProfileErrorState(this.error);
}
