part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
	final User? user;

	const AuthenticationUserChanged(this.user);
}