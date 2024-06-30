import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:renttas/domain/models/newpassword/model.dart';
import 'package:renttas/infrastructure/repository/forgetPassword/repo.dart';
import 'package:renttas/infrastructure/repository/newpassword/repo.dart';
part 'forgetpassword_event.dart';
part 'forgetpassword_state.dart';

class ForgetpasswordBloc
    extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  ForgetpasswordBloc() : super(ForgetpasswordInitial()) {
    String otp = '';
    String email = '';
    on<ForgetpasswordEvent>((event, emit) {
      emit(ForgetpasswordInitial());
    });
    on<ForgetRequestEvent>((event, emit) async {
      emit(ForgetRequestedState());
      if (event.email.isEmpty) {
        emit(ForgetPasswordErrorState(msg: "Enter Your email"));
      } else {
        final response = await ForgetPasswordRepo().forgetpassword(event.email);
        if (response == 'email not found') {
          emit(ForgetPasswordErrorState(msg: response));
        } else if (response.isEmpty) {
          emit(ForgetPasswordErrorState(msg: response));
        } else {
          otp = response;
          email = event.email;
          emit(OtpSendSuccessState());
        }
      }
    });
    on<ForgetOtpChecking>((event, emit) {
      if (event.otp == otp) {
        emit(OtpVerifiedState());
      } else {
        emit(ForgetPasswordErrorState(msg: 'Enterd wrong OTP'));
      }
    });
    on<ResetPasswordRequest>((event, emit) async {
      try {
        final response =
            await NewPasswordRepo().updatePassword(event.model, email);
        if (response) {
          emit(PasswordResentSuccessState());
        } else {
          emit(ForgetPasswordErrorState(msg: 'Try Again!'));
        }
      } catch (e) {
        emit(ForgetPasswordErrorState(msg: 'Some Error occuer'));
      }
    });
  }
}
