part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpEventCalled extends AuthState {}

final class SignupSuccesState extends AuthState {
  final bool user;

  SignupSuccesState({required this.user});
}

final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}
