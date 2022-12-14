part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  AuthenticationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CreateUserSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class CreateUserError extends AuthenticationState {
  @override
  List<Object> get props => [];
}



