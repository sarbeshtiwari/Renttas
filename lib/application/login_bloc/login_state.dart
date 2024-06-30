part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginRequsted extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}

final class LoginSuccesState extends LoginState {
  final bool user;

  LoginSuccesState({required this.user});
}
