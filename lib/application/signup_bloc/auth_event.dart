part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

final class SignUpRequestEvent extends AuthEvent {
  final SignUpModels user;

  SignUpRequestEvent({required this.user});
}
