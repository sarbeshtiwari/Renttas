part of 'forgetpassword_bloc.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetPasswordErrorState extends ForgetpasswordState {
  final String msg;
  ForgetPasswordErrorState({required this.msg});
}

class OtpSendSuccessState extends ForgetpasswordState {}

class ForgetRequestedState extends ForgetpasswordState {}

class OtpVerifiedState extends ForgetpasswordState {}

class PasswordResentSuccessState extends ForgetpasswordState {}
