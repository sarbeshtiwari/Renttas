part of 'forgetpassword_bloc.dart';

@immutable
class ForgetpasswordEvent {}

class ForgetRequestEvent extends ForgetpasswordEvent {
  final String email;
  ForgetRequestEvent({required this.email});
}

final class ForgetOtpChecking extends ForgetpasswordEvent {
  final String otp;
  ForgetOtpChecking({required this.otp});
}

final class ResetPasswordRequest extends ForgetpasswordEvent {
  final NewPasswordModel model;
  ResetPasswordRequest({required this.model});
}
