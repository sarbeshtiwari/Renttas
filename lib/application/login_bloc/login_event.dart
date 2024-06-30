part of 'login_bloc.dart';

@immutable
class LoginEvent {}

final class LoginRequestEvent extends LoginEvent {
  final LoginModel model;
  LoginRequestEvent({required this.model});
}
